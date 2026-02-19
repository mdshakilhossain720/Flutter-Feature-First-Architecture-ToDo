import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../data/datasource/post_remote_datasources.dart';
import '../../data/repository/post_repository_imple.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/usecases/post_usecases.dart';

import '../../../../core/network/dio_client.dart';


final dioProvider = Provider(

  (ref) => ApiClient(),

);


final remoteDataSourceProvider = Provider(

  (ref) => PostRemoteDataSource(

    ref.read(dioProvider),

  ),

);


final repositoryProvider = Provider(

  (ref) => PostRepositoryImpl(

    ref.read(remoteDataSourceProvider),

  ),

);


final useCaseProvider = Provider(

  (ref) => GetPostsUseCase(

    ref.read(repositoryProvider),

  ),

);


final postProvider = FutureProvider<List<PostEntity>>(

  (ref) async {

    return ref.read(useCaseProvider).call();

  },

);
