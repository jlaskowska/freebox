import 'package:flutter/material.dart';
import 'package:freebox/configs/app_config.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Freebox'),
        ),
        body: Center(
          child: Text(
            context.watch<AppConfig>().buildEnvironment.toString(),
          ),
        ),
      ),
    );
  }
}
