class AppUpdateInfo {
  final String version;
  final int? build;
  final String tag;
  final String url;
  final String notes;
  final Map<String, String> assets;

  const AppUpdateInfo({
    required this.version,
    required this.build,
    required this.tag,
    required this.url,
    required this.notes,
    required this.assets,
  });
}

enum UpdateCheckStatus { updateAvailable, upToDate, failed }

class UpdateCheckResult {
  final UpdateCheckStatus status;
  final AppUpdateInfo? update;

  const UpdateCheckResult._(this.status, [this.update]);
  const UpdateCheckResult.updateAvailable(AppUpdateInfo update)
      : this._(UpdateCheckStatus.updateAvailable, update);
  const UpdateCheckResult.upToDate() : this._(UpdateCheckStatus.upToDate);
  const UpdateCheckResult.failed() : this._(UpdateCheckStatus.failed);
}

/// Auto-update is intentionally disabled in this fork.
/// All checks return "up to date" and no network request is performed.
abstract class UpdateChecker {
  static Future<AppUpdateInfo?> fetchLatest() async => null;
  static Future<AppUpdateInfo?> check({bool force = false}) async => null;
  static Future<UpdateCheckResult> checkNow() async =>
      const UpdateCheckResult.upToDate();
  static Future<void> skip(String tag) async {}
}
