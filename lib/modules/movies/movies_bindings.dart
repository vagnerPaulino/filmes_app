import 'package:filmes_app/repositories/movies/movies_repository.dart';
import 'package:filmes_app/repositories/movies/movies_repository_custom_dio_impl.dart';
//import 'package:filmes_app/repositories/movies/movies_repository_impl.dart';
import 'package:get/get.dart';
import './movies_controller.dart';

class MoviesBindings implements Bindings {
@override
void dependencies() {
  //Get.lazyPut<MoviesRepository>(() => MoviesRepositoryImpl());
  Get.lazyPut<MoviesRepository>(() => MoviesRepositoryCustomDioImpl());
  Get.put(MoviesController());
}
}
