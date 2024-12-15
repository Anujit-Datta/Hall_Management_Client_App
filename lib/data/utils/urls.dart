class Urls{
  static const String _baseUrl='https://hall-management-backend.onrender.com/v1/api';

  static const String login='$_baseUrl/user/login';
  static const String reset='$_baseUrl/user/forgot-password';
  static const String resetOtp='$_baseUrl/user/verify-otp';
  static const String setPass='$_baseUrl/user/reset-password';

  static String updateUser(String uid)=>'$_baseUrl/user/$uid';
  static String getUser(String uid)=>'$_baseUrl/user/$uid';
}