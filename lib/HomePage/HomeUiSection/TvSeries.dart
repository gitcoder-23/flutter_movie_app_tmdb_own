import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app_tmdb/apiLinks/apiLinks.dart';
import 'package:http/http.dart' as http;

class TvSeries extends StatefulWidget {
  const TvSeries({super.key});

  @override
  State<TvSeries> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  List<Map<String, dynamic>> populartvseries = [];
  List<Map<String, dynamic>> topratedtvseries = [];
  List<Map<String, dynamic>> onairtvseries = [];

  Future<void> tvseriesfunction() async {
    print('tvseriesfunction');
    /////////////////////////////////////////////
    var populartvresponse = await http.get(Uri.parse(popularTvSeriesUrl));
    if (populartvresponse.statusCode == 200) {
      var tempdata = jsonDecode(populartvresponse.body);
      List<dynamic> populartvjson = tempdata['results'];
      for (var i = 0; i < populartvjson.length; i++) {
        populartvseries.add({
          "name": populartvjson[i]["name"],
          "poster_path": populartvjson[i]["poster_path"],
          "vote_average": populartvjson[i]["vote_average"],
          "Date": populartvjson[i]["first_air_date"],
          "id": populartvjson[i]["id"],
        });
      }
    } else {
      print(populartvresponse.statusCode);
    }
    /////////////////////////////////////////////
    var topratedtvresponse = await http.get(Uri.parse(topRatedTvSeriesUrl));
    if (topratedtvresponse.statusCode == 200) {
      var tempdata = jsonDecode(topratedtvresponse.body);
      List<dynamic> topratedtvjson = tempdata['results'];
      for (var i = 0; i < topratedtvjson.length; i++) {
        topratedtvseries.add({
          "name": topratedtvjson[i]["name"],
          "poster_path": topratedtvjson[i]["poster_path"],
          "vote_average": topratedtvjson[i]["vote_average"],
          "Date": topratedtvjson[i]["first_air_date"],
          "id": topratedtvjson[i]["id"],
        });
      }
    } else {
      print(topratedtvresponse.statusCode);
    }
    /////////////////////////////////////////////
    var onairtvresponse = await http.get(Uri.parse(onAirTvSeriesUrl));
    if (onairtvresponse.statusCode == 200) {
      var tempdata = jsonDecode(onairtvresponse.body);
      List<dynamic> onairtvjson = tempdata['results'];
      for (var i = 0; i < onairtvjson.length; i++) {
        onairtvseries.add({
          "name": onairtvjson[i]["name"],
          "poster_path": onairtvjson[i]["poster_path"],
          "vote_average": onairtvjson[i]["vote_average"],
          "Date": onairtvjson[i]["first_air_date"],
          "id": onairtvjson[i]["id"],
        });
      }
    } else {
      print(onairtvresponse.statusCode);
    }
    /////////////////////////////////////////////
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: tvseriesfunction(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: Colors.amber.shade400));
          } else {
            return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // sliderlist(populartvseries, "Popular Now", "tv", 20),
                  // sliderlist(onairtvseries, "On Air Now", "tv", 20),
                  // sliderlist(topratedtvseries, "Top Rated", "tv", 20)
                ]);
          }
        });
  }
}
