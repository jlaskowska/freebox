abstract class ISettingsDatabase {
  set userSeenOnboarding(bool value);

  bool get userSeenOnboarding;

  Future<void> initialize();
}
