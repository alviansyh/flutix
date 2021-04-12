import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'upcoming_movie_event.dart';
part 'upcoming_movie_state.dart';

class UpcomingMovieBloc extends Bloc<UpcomingMovieEvent, UpcomingMovieState> {
  UpcomingMovieBloc() : super(UpcomingMovieInitial());

  @override
  Stream<UpcomingMovieState> mapEventToState(
    UpcomingMovieEvent event,
  ) async* {
    if (event is FetchUpcomingMovies) {
    List<Movie> movies = await MovieServices.getUpcomingMovies(1);

    yield UpcomingMovieLoaded(movies: movies);
    }
  }
}
