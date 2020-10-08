import 'dart:io';

import 'package:meta/meta.dart';

import '../models/freebox.dart';

abstract class IBackendService {
  Stream<List<Freebox>> freeboxStream();

  Future<void> initializeBackend();

  Future<bool> publishFreebox({
    @required File image,
    @required String description,
    @required String address,
  });
}
