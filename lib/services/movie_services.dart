part of 'services.dart';

class MovieServices {
  static Future<List<Movie>> getMovies(int page, {http.Client client}) async {
    var url = Uri.https("api.themoviedb.org", "/3/movie/now_playing", {
      "api_key": "$apiKey",
      "language": "en-US",
      "region": "ID",
      "page": "$page"
    });

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<List<Movie>> getUpcomingMovies(int page, {http.Client client}) async {
    var url = Uri.https("api.themoviedb.org", "/3/movie/upcoming", {
      "api_key": "$apiKey",
      "language": "en-US",
      "region": "ID",
      "page": "$page"
    });

    client ??= http.Client();

    var response = await client.get(url);

    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    return result.map((e) => Movie.fromJson(e)).toList();
  }
}
