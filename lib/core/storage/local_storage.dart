import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const _keyOnboardingShown = 'onboarding_shown';
  static const _keyThemeMode = 'theme_mode';
  static const _keyLanguage = 'language';
  static const _keyNotificationsEnabled = 'notifications_enabled';

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  // Onboarding
  Future<bool> isOnboardingShown() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyOnboardingShown) ?? false;
  }

  Future<void> setOnboardingShown() async {
    final prefs = await _prefs;
    await prefs.setBool(_keyOnboardingShown, true);
  }

  // Theme
  Future<String> getThemeMode() async {
    final prefs = await _prefs;
    return prefs.getString(_keyThemeMode) ?? 'light';
  }

  Future<void> setThemeMode(String mode) async {
    final prefs = await _prefs;
    await prefs.setString(_keyThemeMode, mode);
  }

  // Language
  Future<String> getLanguage() async {
    final prefs = await _prefs;
    return prefs.getString(_keyLanguage) ?? 'es';
  }

  Future<void> setLanguage(String lang) async {
    final prefs = await _prefs;
    await prefs.setString(_keyLanguage, lang);
  }

  // Notifications
  Future<bool> areNotificationsEnabled() async {
    final prefs = await _prefs;
    return prefs.getBool(_keyNotificationsEnabled) ?? true;
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    final prefs = await _prefs;
    await prefs.setBool(_keyNotificationsEnabled, enabled);
  }

  // Generic
  Future<void> setString(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  Future<void> remove(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  Future<void> clearAll() async {
    final prefs = await _prefs;
    await prefs.clear();
  }
}
