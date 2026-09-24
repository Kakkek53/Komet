import 'update_checker.dart';

enum UpdateInstallStatus { done, noAsset, downloadFailed, installFailed }

class UpdateInstallResult {
  final UpdateInstallStatus status;
  final String? error;

  const UpdateInstallResult(this.status, {this.error});

  bool get ok => status == UpdateInstallStatus.done;
}

/// APK downloading/installing is intentionally disabled in this fork.
abstract class UpdateInstaller {
  static bool get isSupported => false;

  static Future<UpdateInstallResult> downloadAndInstall(
    AppUpdateInfo info, {
    void Function(double progress)? onProgress,
  }) async =>
      const UpdateInstallResult(UpdateInstallStatus.noAsset);

  static Future<String?> resolveApkUrl(AppUpdateInfo info) async => null;
}
