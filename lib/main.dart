import 'package:filmes_app/modules/home/home_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:filmes_app/modules/movies/movies_page.dart';
import 'package:filmes_app/modules/movies/movies_bindings.dart';

import 'modules/home/home_page.dart';

void main() {
  load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/', 
          page: () => HomePage(),
          binding: HomeBindings()
        ),
        GetPage(
          name: '/movies', 
          page: () => MoviesPage(),
          binding: MoviesBindings()
        ),
      ],
    );
  }
}

