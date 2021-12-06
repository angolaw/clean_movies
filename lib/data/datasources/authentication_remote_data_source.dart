import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/models/request_model_token.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenModel> getRequestToken();
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String> createSession(Map<String, dynamic> requestBody);
}

class AuthenticationRemoteDataSourceImpl
    extends AuthenticationRemoteDataSource {
  final ApiClient client;

  AuthenticationRemoteDataSourceImpl({required this.client});
  @override
  Future<String> createSession(Map<String, dynamic> requestBody) async {
    final response = await client.post(
      '/authentication/session/new',
      params: requestBody,
    );
    return response['success'] ? response['session_id'] : null;
  }

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final response = await client.get('authentication/token/new');
    final requestTokenModel = RequestTokenModel.fromJson(response);
    return requestTokenModel;
  }

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await client
        .post('authentication/token/validate_with_login', params: requestBody);
    return RequestTokenModel.fromJson(response);
  }
}
