import 'package:house_rent/core/constant/const.dart';
import 'package:http/http.dart' as http;

class GetBanner {
  static Future<http.Response> getBanner() async {
    final url = Uri.parse('$baseUrl$banner?populate=*');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        return http.Response('error', 300);
      }
    } catch (e) {
      return http.Response('Server Error', 500);
    }
  }
}
