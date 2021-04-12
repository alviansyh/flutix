part of 'widgets.dart';

class ComingMovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  ComingMovieCard(this.movie, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(imgBaseUrl + "w500" + movie.posterPath),
              fit: BoxFit.cover)),
      child: Container(
        height: 170,
        width: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.61),
              Colors.black.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}
