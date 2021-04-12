import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/bloc/blocs.dart';
import 'package:flutix/services/services.dart';
import 'package:flutix/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => MovieBloc()..add(FetchMovies())),
          BlocProvider(create: (_) => UpcomingMovieBloc()..add(FetchUpcomingMovies())),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert';import 'dart:developer';
// import 'package:http/http.dart' as http;
//
// void main(List<String> arguments) async {
//   // This example uses the Google Books API to search for books about http.
//   // https://developers.google.com/books/docs/overview
//   var url = Uri.https("api.themoviedb.org", "/3/discover/movie", {
//     "api_key": "74b6b690767cf703d58065a3bd929b6f",
//     "language": "en-US",
//     "sort_by": "popularity.desc",
//     "include_adult": "false",
//     "include_video": "false",
//     "page": "1"
//   });
//
//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   // var response = await client.get(url);
//
//   if (response.statusCode != 200) {
//     print('Request failed');
//   }
//
//   var data = json.decode(response.body);
//   var result = data['results'][2]['title'];
//   log(result);
// }