import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = 'https://api.themoviedb.org/3/movie';
  Future<Map<String, dynamic>> getMovies({required String endPointUrl}) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkOGUwYTBlZmQzZDY3Mjc1MWQ5Zjg3YmM3YWFhNjhkNiIsIm5iZiI6MTc0NTQzMDg1MS4wMDg5OTk4LCJzdWIiOiI2ODA5Mjk0MzZlMWE3NjllODFlZjBiNGUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.tZEN6ZTQu_G2kyhKYg5kiJYrZP9Y_4NipjU67Ncaoec',
      'accept': 'application/json',
    };
    final response = await http.get(
      Uri.parse('$baseUrl$endPointUrl'),
      headers: headers,
    );
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }
}
