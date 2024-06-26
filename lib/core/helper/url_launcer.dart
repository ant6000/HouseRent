import 'package:url_launcher/url_launcher.dart';

class PhoneLauncer {
  static Future<void> launchphone(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
