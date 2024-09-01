import 'package:package_info_plus/package_info_plus.dart';

class AppVersionService {
  static late String appVersion;

  static Future<void> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }
}
