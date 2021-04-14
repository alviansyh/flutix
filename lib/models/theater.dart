part of 'models.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  List<Object> get props => [name];
}

List<Theater> dummyTheaters = [
  Theater("DEPOK MALL CGV"),
  Theater("DEPOK TOWN SQUARE CINEPOLIS"),
];