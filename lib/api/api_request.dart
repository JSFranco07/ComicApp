import 'dart:convert';
import 'dart:io';

import 'package:comic_tech/utils/utils.dart';
import 'package:http/http.dart' as http;

/// Class to define the calls to the api
class ApiRequest {
  /// Headers
  static final Map<String, String> _headers = {};

  /// Url
  static Uri _uri = Uri();

  /// Method to set url and headers
  static Future<void> _setRequestData(String path) async {
    /// Define to url
    _uri = Uri.parse(
      '$path?api_key=${Environment.apiKey}&format=json',
    );

    /// Define to headers
    _headers[HttpHeaders.contentTypeHeader] = 'application/json';
  }

  /// Parse json to Map
  static dynamic _decode(String response) => json.decode(response);

  /// Encode json Map in String
  static String _encode(Map<String, dynamic> response) => json.encode(response);

  /// Get requests
  static Future<dynamic> get(String path) async {
    await _setRequestData(path);
    final response = await http.get(
      _uri,
      headers: _headers,
    );
    return _decode(response.body);
  }

  /// Post requests
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

  ///  Put requests
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

  /// Delete requests
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
