import 'package:flutter/material.dart';
import 'package:freebox/widgets/my_app.dart';
import 'package:provider/provider.dart';

import 'configs/app_config.dart';

void main() => runApp(
      Provider(
        create: (_) => AppConfig.dev(),
        child: MyApp(),
      ),
    );
