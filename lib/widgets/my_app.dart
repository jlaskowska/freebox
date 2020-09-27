import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/modules/analytics/analytics.dart';
import 'package:freebox/modules/onboarding/widgets/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
            headline1: TextStyle(
              color: AppColors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: TextStyle(
              color: AppColors.navyBlue,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
      ),

      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizationsDelegate.supportedLocals,
      navigatorObservers: [
        AnalyticsService.observer,
      ],
      home: Onboarding(),
      // home: _HomeScreen(),
    );
  }
}
