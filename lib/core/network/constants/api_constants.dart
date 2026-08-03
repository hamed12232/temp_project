abstract class ApiConstants {
  const ApiConstants._();

  static const String baseUrl = 'https://v2.golden4tic.com/api/v1/';
  static const String apiKey = 'TICKETS-NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  static const String authorization = 'Authorization';
  static const String apiKeyHeader = 'X-SECRET-KEY';
  static const String bearer = 'Bearer';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';
  static const String applicationJson = 'application/json';

  static const String accessTokenKey = 'ACCESS_TOKEN';
  static const String refreshTokenKey = 'REFRESH_TOKEN';
}
