import 'package:meta/meta.dart';

abstract class BaseAnalyticsEvent {
  final String name;
  final Map<String, dynamic> parameters;

  BaseAnalyticsEvent({
    @required this.name,
    this.parameters = const <String, dynamic>{},
  });
}
