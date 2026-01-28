import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';

class AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSource(this.dioClient);

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await dioClient.post(
      ApiEndpoints.login,
      data: {"email": email, "password": password},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
  }) async {
    final response = await dioClient.post(
      ApiEndpoints.register,
      data: {"email": email, "password": password},
    );
    return response.data;
  }
}
