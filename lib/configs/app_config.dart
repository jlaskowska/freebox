import 'package:freebox/enums/build_environment.dart';

class AppConfig {
  final BuildEnvironment buildEnvironment;

  const AppConfig.dev() : buildEnvironment = BuildEnvironment.dev;

  const AppConfig.prod() : buildEnvironment = BuildEnvironment.prod;
}
