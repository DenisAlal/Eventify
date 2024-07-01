part of data;

abstract class AppConfigStorageRepository {

  bool? getOnboardingStatus();
  Future<void> setOnboardingStatus();
}

@LazySingleton(as: AppConfigStorageRepository)
class AppConfigStorageRepositoryImpl
    implements AppConfigStorageRepository {

  static const _hiveBoxName = 'app';
  static const _onboardingKey = 'onboarding';

  static Future init() async {
    await Hive.openBox(_hiveBoxName);
  }

  Box get _hiveBox => Hive.box(_hiveBoxName);

  // App

  @override
  bool? getOnboardingStatus() {
    final onboardingStatus = _hiveBox.get(_onboardingKey);
    if (onboardingStatus is! bool) return null;
    return onboardingStatus;
  }

  @override
  Future<void> setOnboardingStatus() async {
    await _hiveBox.put(_onboardingKey, true);
  }

}
