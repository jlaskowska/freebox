import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import '../models/freebox.dart';
import 'i_backend_service.dart';

class BackendService implements IBackendService {
  static const _freeboxCollectionPath = 'freeboxes';

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  @override
  Stream<List<Freebox>> freeboxStream() {
    final stream = FirebaseFirestore.instance.collection(_freeboxCollectionPath).snapshots();
    return stream.map((snapshot) => snapshot.docs.map((doc) => Freebox.fromJson(doc.data())).toList());
  }

  @override
  Future<bool> publishFreebox({
    @required File image,
    @required String description,
    @required String address,
  }) async {
    if (image != null && description != null && address != null) {
      final id = Uuid().v1();

      final storageReference = FirebaseStorage.instance.ref().child(id);
      final uploadTask = storageReference.putFile(
        image,
        StorageMetadata(
          contentType: 'image/jpg', //TODO what about png?
        ),
      );
      final result = await uploadTask.onComplete;
      if (result.error == null) {
        final url = await result.ref.getDownloadURL();
        final freebox = Freebox(
          id: id,
          description: description,
          address: address,
          imageUrl: url,
        );

        final documentReference = FirebaseFirestore.instance.collection(_freeboxCollectionPath).doc(id);
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          await transaction.set(
            documentReference,
            freebox.toJson(),
          );
        });

        return true;
      }
    }

    return false;
  }
}
