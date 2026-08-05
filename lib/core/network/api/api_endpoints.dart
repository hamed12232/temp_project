abstract class ApiEndpoints {
  const ApiEndpoints._();

  static const String login = 'auth/login';
  static const String uploadFile = '/upload';
  static const String register = 'auth/register';
  static const String refreshToken = 'auth/refresh';
  static const String users = 'users';
  static const String userById = 'users/{id}';
  static const String stories = 'stories';
}
