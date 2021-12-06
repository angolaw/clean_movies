abstract class AuthenticationRemoteDataSource {
  Future<RequestModelToken> getRequestToken();
  Future<RequestModelToken> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String> createSession(Map<String, dynamic> requestBody);
}
