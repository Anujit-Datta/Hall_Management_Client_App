class Urls{
  static const String _baseUrl='https://hall-management-backend.onrender.com/v1/api/';

  static const String promotionalSliderList='$_baseUrl/ListProductSlider';
  static const String login='$_baseUrl/user/login';

  static String updateUser(String uid)=>'$_baseUrl/user/$uid';

}