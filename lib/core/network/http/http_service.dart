import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import 'http_exception.dart';

@LazySingleton()
class HttpService {
  final http.Client _client;
  final Duration defaultTimeout;

  HttpService({
    http.Client? client,
    this.defaultTimeout = const Duration(seconds: 30),
  }) : _client = client ?? http.Client();

  Map<String, String> _buildHeaders({
    Map<String, String>? customHeaders,
    String? token,
  }) {
    final headers = <String, String>{};
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }
    return headers;
  }

  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
    Duration? timeout,
    String? token,
  }) async {
    final uri = Uri.parse(url);
    final requestHeaders = _buildHeaders(customHeaders: headers, token: token);

    try {
      final response = await _client
          .get(uri, headers: requestHeaders)
          .timeout(timeout ?? defaultTimeout);

      if (response.statusCode >= 400) {
        throw HttpException(
          message:
              'HTTP error ${response.statusCode}: ${response.reasonPhrase}',
          statusCode: response.statusCode,
          url: url,
        );
      }
      return response;
    } on HttpException {
      rethrow;
    } on TimeoutException catch (e) {
      throw HttpException(
        message: 'Connection timed out: $url',
        url: url,
        originalException: e,
      );
    } on http.ClientException catch (e) {
      throw HttpException(
        message: 'HTTP client error: ${e.message}',
        url: url,
        originalException: e,
      );
    } catch (e) {
      throw HttpException(
        message: 'Unexpected network error: $e',
        url: url,
        originalException: e,
      );
    }
  }

  Future<Uint8List> downloadBytes(
    String url, {
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    final response = await get(url, headers: headers, timeout: timeout);
    return response.bodyBytes;
  }

  Future<File> downloadFile({
    required String url,
    required String savePath,
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    final bytes = await downloadBytes(url, headers: headers, timeout: timeout);
    final file = File(savePath);
    await file.parent.create(recursive: true);
    return await file.writeAsBytes(bytes);
  }

  //if need it
  void close() {
    _client.close();
  }
}
