import 'package:flutter/material.dart';
import 'package:freebox/enums/build_environment.dart';

class AppConfig {
  BuildEnvironment buildEnvironment;

  AppConfig({
    @required this.buildEnvironment,
  });

  AppConfig.dev() {
    buildEnvironment = BuildEnvironment.dev;
  }

  AppConfig.prod() {
    buildEnvironment = BuildEnvironment.prod;
  }
}
