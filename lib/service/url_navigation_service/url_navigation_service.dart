import 'package:url_launcher/url_launcher.dart';

class UrlNavigationService {
  static Future<bool> navigateTo(String url) async {
    final uri = Uri.parse(url);
    return await launchUrl(uri);
  }
}
