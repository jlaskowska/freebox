import 'package:meta/meta.dart';

abstract class IAuthService {
  @protected
  Future<void> signInAnonymously();
}
