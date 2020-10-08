import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freebox/modules/backend_service/src/models/freebox.dart';

import 'i_backend_service.dart';

class BackendService implements IBackendService {
  static const _freeboxCollectionPath = 'freeboxes';

  @override
  Stream<List<Freebox>> freeboxStream() {
    final stream = FirebaseFirestore.instance.collection(_freeboxCollectionPath).snapshots();
    return stream.map((snapshot) => snapshot.docs.map((doc) => Freebox.fromJson(doc.data())).toList());
  }

  @override
  Future<void> initializeBackend() async {
    await Firebase.initializeApp();
  }
}
