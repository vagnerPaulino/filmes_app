
import 'package:dio/dio.dart';
import 'package:filmes_app/core/dio/custom_dio.dart';
import 'package:filmes_app/core/exceptions/repository_exception.dart';
import 'package:filmes_app/models/movies.dart';
import 'package:filmes_app/repositories/movies/movies_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MoviesRepositoryCustomDioImpl implements MoviesRepository {
  @override
  Future<Movies> findPopularMovies() async {

    try {
      final apiKey = env['apiKey'] ?? '';
      
      final dio = CustomDio();
      final timer = DateTime.now();
      final result = await dio.get(
        '/movie/popular',
        queryParameters: {
          'api_key': apiKey,
          'language': 'pt-BR'
        }
      );
      final totalExecution = DateTime.now().difference(timer);
      print('Levou ${totalExecution.inMilliseconds} inMilliseconds');

      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }

  @override
  Future<Movies> findTopRatedMovies() async {
    try {
      final apiKey = env['apiKey'] ?? '';
      
      final dio = CustomDio();
      final timer = DateTime.now();
      final result = await dio.get(
        '/movie/top_rated',
        queryParameters: {
          'api_key': apiKey,
          'language': 'pt-BR'
        }
      );
      final totalExecution = DateTime.now().difference(timer);
      print('Levou ${totalExecution.inMilliseconds} inMilliseconds');
            
      return Movies.fromMap(result.data);
    } on DioError catch (e, s) {
      print(e);
      print(s);
      throw RepositoryException();
    }
  }
}