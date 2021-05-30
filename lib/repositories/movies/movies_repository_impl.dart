
import 'package:dio/dio.dart';
import 'package:filmes_app/core/exceptions/repository_exception.dart';
import 'package:filmes_app/models/movies.dart';
import 'package:filmes_app/repositories/movies/movies_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  @override
  Future<Movies> findPopularMovies() async {

    try {
      final apiKey = env['apiKey'] ?? '';
      
      final dio = Dio();
      final result = await dio.get(
        'https://api.themoviedb.org/3/movie/top_rated',
        queryParameters: {
          'api_key': apiKey,
          'language': 'pt-BR'
        }
      );
      
      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }

  @override
  Future<Movies> findTopRatedMovies() {
    // TODO: implement findTopRatedMovies
    throw UnimplementedError();
  }
  
}