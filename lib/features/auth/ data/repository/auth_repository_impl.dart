import '../../domain/repository/auth_repository.dart';
import '../datasource/ auth_remote_datasource.dart';
import '../models/login_model.dart';
import '../models/use_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<User> login(String email, String password) async {
    final data = await remote.login(email: email, password: password);
    return UserModel.fromJson(data['data']).toEntity();
  }

  @override
  Future<void> register(String email, String password) async {
    await remote.register(email: email, password: password);
  }
}
