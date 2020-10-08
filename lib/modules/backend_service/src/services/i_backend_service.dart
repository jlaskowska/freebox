import '../models/freebox.dart';

abstract class IBackendService {
  Stream<List<Freebox>> freeboxStream();

  Future<void> initializeBackend();
}
