import '../../domain/entities/post_entity.dart';
import '../../domain/repository/post_repository.dart';
import '../datasource/post_remote_datasources.dart';
import '../datasources/post_remote_datasource.dart';

class PostRepositoryImpl implements PostRepository {

  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PostEntity>> getPosts() async {

    final result = await remoteDataSource.getPosts();

    return result.map((e) => e.toEntity()).toList();

  }

}
