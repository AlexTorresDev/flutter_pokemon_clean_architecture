import 'dart:convert';

import 'package:http/http.dart' show Client, Response;
import 'package:flutter_pokemon_clean_architecture/src/core/framework/utils/constants.dart';

class ClientService {
  ClientService();

  final Client client = Client();

  Future<Response> get(String? url) async {
    return await client.get(
      Uri.parse('$baseURL${url ?? ''}'),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<Response> post(
    String? url, {
    Map? headers,
    required Object body,
  }) async {
    final h = {...headers ?? {}};

    return await client.post(
      Uri.parse('$baseURL${url ?? ''}'),
      headers: {...h, 'Content-Type': 'application/json'},
      body: utf8.encode(jsonEncode(body)),
    );
  }
}
