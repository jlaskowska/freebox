import 'dart:io';

import 'package:meta/meta.dart';

import '../models/freebox.dart';

abstract class IBackendService {
  Future<void> initialize();

  Stream<List<Freebox>> freeboxStream();

  Future<bool> publishFreebox({
    @required File image,
    @required String description,
    @required String address,
  });
}
