import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, double>> getCoordinates(String address) async {
  const String apiKey = 'AIzaSyCgAwTVkr-g-3etQ3eb2X-ZfBPqlpM8mK8';
  final String url =
      'https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$apiKey';
  print('called');
  final response = await http.get(Uri.parse(url));
  print(response.body);
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (data['status'] == 'OK') {
      final location = data['results'][0]['geometry']['location'];
      return {'lat': location['lat'], 'lng': location['lng']};
    }
  }
  throw Exception('Failed to get coordinates');
}
