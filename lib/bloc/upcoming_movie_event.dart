part of 'upcoming_movie_bloc.dart';

abstract class UpcomingMovieEvent extends Equatable {
  const UpcomingMovieEvent();
}


class FetchUpcomingMovies extends UpcomingMovieEvent {
  @override
  List<Object> get props => [];
}