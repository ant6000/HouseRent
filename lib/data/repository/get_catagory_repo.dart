import 'package:house_rent/core/constant/const.dart';
import 'package:http/http.dart' as http;

class CategoryServices {
  static Future<http.Response> getCategories() async {
    const String apiUrl = baseUrl+category;
    final url = Uri.parse(apiUrl);
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        return http.Response('error', 300);
      }
    } catch (e) {
        return http.Response(e.toString(), 500);
    }
  }
}
