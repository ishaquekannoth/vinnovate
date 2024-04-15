String apiKey = "Your API KEY HERE";

class UrlStrings {
  static String baseUrl = "https://api.github.com/users/";
  static Map<String, String> tokenHeader = {'Authorization': 'Bearer $apiKey'};
}
