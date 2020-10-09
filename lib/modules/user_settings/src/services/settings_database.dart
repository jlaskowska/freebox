import 'package:hive/hive.dart';

import 'i_settings_database.dart';

class SettingsDatabase extends ISettingsDatabase {
  static const _boxName = 'settings';

  Box<dynamic> _box;

  @override
  Future<void> initialize() async {
    _box = await Hive.openBox(_boxName);
  }

  @override
  set userSeenOnboarding(value) => _box.put(_Keys.userSeenOnboarding, value);

  @override
  bool get userSeenOnboarding => _box.get(_Keys.userSeenOnboarding, defaultValue: _Defaults.userSeenOnboarding);
}

class _Keys {
  static const userSeenOnboarding = 'userSeenOnboarding';
}

class _Defaults {
  static const userSeenOnboarding = false;
}
