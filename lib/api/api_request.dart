import 'dart:convert';
import 'dart:io';

import 'package:comic_tech/utils/utils.dart';
import 'package:http/http.dart' as http;

/// Clase para hacer las peticiones a la API
class ApiRequest {
  /// Headers de la petición
  static final Map<String, String> _headers = {};

  /// Url de la petición
  static Uri _uri = Uri();

  /// Método para establecer la url y los headers en las peticiones
  static Future<void> _setRequestData(String path) async {
    /// Se define la url para la petición
    _uri = Uri.parse(
      '$path?api_key=${Environment.apiKey}&format=json',
    );

    /// Se definen los headers
    _headers[HttpHeaders.contentTypeHeader] = 'application/json';
  }

  /// Parse un json en formato string a un Map
  static dynamic _decode(String response) => json.decode(response);

  /// Encode un json en formato Map a un String
  static String _encode(Map<String, dynamic> response) => json.encode(response);

  ///Realiza peticiones tipo GET a la API
  static Future<dynamic> get(String path) async {
    await _setRequestData(path);
    final response = await http.get(
      _uri,
      headers: _headers,
    );
    return _decode(response.body);
  }

  ///Realiza peticiones tipo POST a la API
  static Future<dynamic> post(String path, Map<String, dynamic> data) async {
    await _setRequestData(path);
    final body = _encode(data);
    try {
      final response = await http.post(
        _uri,
        body: body,
        headers: _headers,
      );
      return _decode(response.body);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  /// Realiza peticiones tipo PUT a la API
  static Future<dynamic> put(String path, Map<String, dynamic> data) async {
    await _setRequestData(path);
    final body = _encode(data);
    try {
      final response = await http.put(
        _uri,
        body: body,
        headers: _headers,
      );
      return _decode(response.body);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  /// Realiza peticiones tipo DELETE a la API
  static Future<dynamic> delete(String path) async {
    await _setRequestData(path);
    try {
      final response = await http.delete(
        _uri,
        headers: _headers,
      );
      return _decode(response.body);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
