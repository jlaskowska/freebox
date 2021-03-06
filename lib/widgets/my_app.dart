import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/configs/route_names.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/modules/analytics/analytics.dart';
import 'package:freebox/modules/backend_service/bacend_service.dart';
import 'package:freebox/modules/onboarding/widgets/onboarding.dart';
import 'package:freebox/modules/user_settings/user_settings.dart';
import 'package:freebox/widgets/custom_circular_progress_indicator.dart';
import 'package:freebox/widgets/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _initializeAppFuture;
  final ISettingsDatabase _settingsDatabase = SettingsDatabase();
  final IBackendService _backendService = BackendService();

  @override
  void initState() {
    super.initState();
    _initializeAppFuture = _initializeApp();
  }

  Future<void> _initializeApp() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await _settingsDatabase.initialize();
    await _backendService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
            future: _initializeAppFuture,
            builder: (_, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: CustomCircularProgressIndicator(),
                  );
                default:
                  return MultiProvider(
                    providers: [
                      Provider<ISettingsDatabase>.value(
                        value: _settingsDatabase,
                      ),
                      Provider<IBackendService>.value(
                        value: _backendService,
                      ),
                    ],
                    child: _MyApp(
                      hasSeenOnboarding: _settingsDatabase.userSeenOnboarding,
                    ),
                  );
              }
            }),
      ),
    );
  }
}

class _MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;

  const _MyApp({
    Key key,
    @required this.hasSeenOnboarding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: AppColors.green,
        primaryColor: AppColors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: AppColors.green,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: AppColors.blue,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size(200, 40)),
          ),
        ),
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
      routes: {
        RouteNames.mainScreen: (_) => MainScreen(),
      },
      home: hasSeenOnboarding ? MainScreen() : Onboarding(),
    );
  }
}
