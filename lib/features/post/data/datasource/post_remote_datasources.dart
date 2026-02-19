import '../../../../core/network/dio_client.dart';
import '../../presentation/screen/widgets/post_widgets.dart';


class PostRemoteDataSource {

  final ApiClient dioClient;

  PostRemoteDataSource(this.dioClient);

  Future<List<PostModel>> getPosts() async {

    final response = await dioClient.get(

      "https://jsonplaceholder.typicode.com/posts",

    );

    return (response.data as List)

        .map((e) => PostModel.fromJson(e))

        .toList();

  }

}
