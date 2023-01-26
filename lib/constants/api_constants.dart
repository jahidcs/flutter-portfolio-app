class ApiConstants {
  ApiConstants._();

  // https://api.github.com/users/
  // https://api.github.com/users/jahidcs

  static const String _baseUrl = "https://api.github.com/users";
  static const String myself = "$_baseUrl/jahidcs";
  static const String repos = "$_baseUrl/jahidcs/repos";
  static const String searchProfile = '$_baseUrl/';
  static const String searchedProfileRepo = '$_baseUrl/';
}
