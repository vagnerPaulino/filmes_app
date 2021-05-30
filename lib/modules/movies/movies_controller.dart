import 'package:filmes_app/models/movie.dart';
import 'package:filmes_app/models/movies.dart';
import 'package:filmes_app/repositories/movies/movies_repository.dart';
import 'package:get/get.dart';

class MoviesController extends GetxController {

  String type = Get.arguments;
  final _totalPages = 0.obs;
  final _movies = <Movie>[].obs;

  int get totalPages => _totalPages.value;
  List<Movie> get movies => _movies;

  @override
  Future<void> onInit() async {
    await findMovies();
        super.onInit();
  }
    
  Future<void> findMovies() async {
    MoviesRepository repository = Get.find();
    if(type == 'populares') {
      final movies = await repository.findPopularMovies();
      _totalPages(movies.totalPages);
      _movies.assignAll(movies.results);
    }else {
      final movies = await repository.findTopRatedMovies();
      _totalPages(movies.totalPages);
      _movies.assignAll(movies.results);
    }
  }
}