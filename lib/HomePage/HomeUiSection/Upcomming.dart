import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app_tmdb/apiLinks/apiLinks.dart';
import 'package:flutter_movie_app_tmdb/components/repttext.dart';
import 'package:http/http.dart' as http;

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  List<Map<String, dynamic>> getUpcomminglist = [];
  Future<void> getUpcomming() async {
    var response = await http.get(Uri.parse(upcomingMovieUrl));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var i = 0; i < json['results'].length; i++) {
        getUpcomminglist.add({
          "poster_path": json['results'][i]['poster_path'],
          "name": json['results'][i]['title'],
          "vote_average": json['results'][i]['vote_average'],
          "Date": json['results'][i]['release_date'],
          "id": json['results'][i]['id'],
        });
      }
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUpcomming(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // sliderlist(getUpcomminglist, "Upcomming", "movie", 20),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 15, bottom: 40),
                      child: tittletext("Many More Coming Soon... "))
                ]);
          } else {
            return const Center(
                child: CircularProgressIndicator(color: Colors.amber));
          }
        });
  }
}
