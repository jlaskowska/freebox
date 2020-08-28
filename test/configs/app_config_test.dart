import 'package:flutter_test/flutter_test.dart';
import 'package:freebox/configs/app_config.dart';
import 'package:freebox/enums/build_environment.dart';

void main() {
  test('AppConfig.dev has BuildEnvironment,dev', () {
    final appConfig = AppConfig.dev();
    expect(appConfig.buildEnvironment, BuildEnvironment.dev);
  });

  test('AppConfig.prod has BuildEnvironment,prod', () {
    final appConfig = AppConfig.prod();
    expect(appConfig.buildEnvironment, BuildEnvironment.prod);
  });
}
