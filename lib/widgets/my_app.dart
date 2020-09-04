import 'package:flutter/material.dart';
import 'package:freebox/configs/app_config.dart';
import 'package:freebox/modules/analytics/analytics.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        AnalyticsService.observer,
      ],
      home: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Freebox'),
      ),
      body: Center(
        child: Text(
          context.watch<AppConfig>().buildEnvironment.toString(),
        ),
      ),
    );
  }
}
