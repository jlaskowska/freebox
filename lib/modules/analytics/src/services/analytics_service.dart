import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/widgets.dart';
import '../models/base_analytics_event.dart';

abstract class AnalyticsService {
  static final _analytics = FirebaseAnalytics();

  static final _observer = FirebaseAnalyticsObserver(analytics: _analytics);

  static NavigatorObserver get observer => _observer;

  static Future<void> trackEvent(BaseAnalyticsEvent event) async =>
      await _analytics.logEvent(name: event.name, parameters: event.parameters);

  static Future<void> userseenOnboarding() async => await _analytics.logTutorialComplete();
}
