part of 'upcoming_movie_bloc.dart';

abstract class UpcomingMovieState extends Equatable {
  const UpcomingMovieState();
}

class UpcomingMovieInitial extends UpcomingMovieState {
  @override
  List<Object> get props => [];
}

class UpcomingMovieLoaded extends UpcomingMovieState {
  final List<Movie> movies;

  UpcomingMovieLoaded({this.movies});

  @override
  List<Object> get props => [movies];
}