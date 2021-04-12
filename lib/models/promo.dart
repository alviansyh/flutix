part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
      {@required this.title, @required this.subtitle, @required this.discount});

  @override
  // TODO: implement props
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> dummyPromo = [
  Promo(title: "Holiday", subtitle: "Minimal for three members", discount: 35),
  Promo(title: "Family Club", subtitle: "Maximal for five members", discount: 50),
  Promo(title: "Subscription Promo", subtitle: "Minimal one year", discount: 40),
];
