import '../entities/post_entity.dart';
import '../repository/post_repository.dart';

class GetPostsUseCase {

  final PostRepository repository;

  GetPostsUseCase(this.repository);

  Future<List<PostEntity>> call(){

    return repository.getPosts();

  }

}
