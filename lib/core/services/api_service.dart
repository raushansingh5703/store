import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/store_model.dart';

class ApiService {
  static const String _baseUrl = 'https://podpalsapis.neosao.co.in';

  static Future<List<StoreModel>> fetchStores() async {
    final Uri url = Uri.parse('$_baseUrl/nearest-store');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);

        if (body['msg'] == 'success' && body['data'] is List) {
          final List<dynamic> data = body['data'];
          return data.map((item) => StoreModel.fromJson(item)).toList();
        } else {
          throw Exception('Unexpected API format');
        }
      } else {
        throw Exception('Failed to load stores (Status Code: ${response.statusCode})');
      }
    } catch (e) {
      print('Error fetching stores: $e');
      rethrow;
    }
  }
}
