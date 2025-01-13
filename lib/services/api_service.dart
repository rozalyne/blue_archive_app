import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const String baseUrl = 'https://api-blue-archive.vercel.app/api';

  Future<List<Character>> getCharacters() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/characters'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data']; // Ambil key 'data'
        return data.map((item) => Character.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load characters. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
