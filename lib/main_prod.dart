import 'package:flutter/material.dart';
import 'package:freebox/configs/app_config.dart';
import 'package:provider/provider.dart';

import 'widgets/my_app.dart';

void main() => runApp(
      Provider(
        create: (_) => AppConfig.prod(),
        child: MyApp(),
      ),
    );
