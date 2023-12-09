import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mobile/models/movie.dart';
import 'package:mobile/models/television.dart';

class HttpService{
  // final String apiKey = '62021502e94248116f5704eb4881e8e7';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?&api_key=62021502e94248116f5704eb4881e8e7';
  final String baseUrl1 = 'https://api.themoviedb.org/3/discover/tv?&api_key=62021502e94248116f5704eb4881e8e7';
  Future<List> getPopularMovies() async {
    final String uri = baseUrl;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null!;
    }
  }

  Future<List<Movie>> fecthDataPlaces() async {
    Response response = await http.get(Uri.parse(baseUrl));
    List<Movie> movie;
    if (response.statusCode == 200) {
      List<dynamic> listJson =
          json.decode(response.body)["results"];
      movie = listJson.map((e) =>Movie.fromJson(e)).toList();
      // print(movie);
      return movie;
    } else {
      throw Exception('Failed to load data profile');
    }
  }

    Future<List> getTelevision() async {
    final String uri = baseUrl1;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      final jsonResponse = json.decode(result.body);
      final televisionsMap = jsonResponse['result'];
      List televisions = televisionsMap.map((i) => Television.fromJson(i)).toList();
      return televisions;
    } else {
      print("Fail");
      return null!;
    }
  }

 Future<List<Television>> fecthDataPlaces1() async {
  Response response = await http.get(Uri.parse(baseUrl1));
  List<Television> television;
  if (response.statusCode == 200) {
    List<dynamic> listJson = json.decode(response.body)["results"];
    television = listJson.map((e) => Television.fromJson(e)).toList();
    return television;
  } else {
    throw Exception('Failed to load data profile');
  }
}

}

