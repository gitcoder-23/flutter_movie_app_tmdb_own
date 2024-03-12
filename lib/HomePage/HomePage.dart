import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_movie_app_tmdb/apiLinks/apiLinks.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int uval = 1;
  List<Map<String, dynamic>> trendingweek = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> trandingListHome(int checkerno) async {
    if (checkerno == 1) {
      var trendingDayWeekResponse = await http.get(Uri.parse(trendingWeekUrl));
      print('week-=> $trendingDayWeekResponse');
      if (trendingDayWeekResponse.statusCode == 200) {
        var tempData = jsonDecode(trendingDayWeekResponse.body);

        List<dynamic> trendingWeekJson = tempData['results'];

        for (var i = 0; i < trendingWeekJson.length; i++) {
          trendingweek.add({
            "id": trendingWeekJson[i]['id'],
            "poster_path": trendingWeekJson[i]['poster_path'],
            "vote_average": trendingWeekJson[i]['vote_average'],
            "vote_count": trendingWeekJson[i]['vote_count'],
            "adult": trendingWeekJson[i]['adult'],
            "backdrop_path": trendingWeekJson[i]['backdrop_path'],
            "title": trendingWeekJson[i]['title'],
            "original_language": trendingWeekJson[i]['original_language'],
            "original_title": trendingWeekJson[i]['original_title'],
            "overview": trendingWeekJson[i]['overview'],
            "media_type": trendingWeekJson[i]['media_type'],
            "popularity": trendingWeekJson[i]['popularity'],
            "release_date": trendingWeekJson[i]['release_date'],
            "video": trendingWeekJson[i]['video'],
            'indexno': i,
          });
        }
      }
    } else if (checkerno == 2) {
      var trendingDayWeekResponse = await http.get(Uri.parse(trendingDayUrl));
      print('Day-=> $trendingDayWeekResponse');
      if (trendingDayWeekResponse.statusCode == 200) {
        var tempData = jsonDecode(trendingDayWeekResponse.body);

        List<dynamic> trendingWeekJson = tempData['results'];

        for (var i = 0; i < trendingWeekJson.length; i++) {
          trendingweek.add({
            "id": trendingWeekJson[i]['id'],
            "poster_path": trendingWeekJson[i]['poster_path'],
            "vote_average": trendingWeekJson[i]['vote_average'],
            "vote_count": trendingWeekJson[i]['vote_count'],
            "adult": trendingWeekJson[i]['adult'],
            "backdrop_path": trendingWeekJson[i]['backdrop_path'],
            "title": trendingWeekJson[i]['title'],
            "original_language": trendingWeekJson[i]['original_language'],
            "original_title": trendingWeekJson[i]['original_title'],
            "overview": trendingWeekJson[i]['overview'],
            "media_type": trendingWeekJson[i]['media_type'],
            "popularity": trendingWeekJson[i]['popularity'],
            "release_date": trendingWeekJson[i]['release_date'],
            "video": trendingWeekJson[i]['video'],
            'indexno': i,
          });
        }
      }
    } else if (checkerno == 3) {
      var trendingDayWeekResponse = await http.get(Uri.parse(discoverUrl));
      print('discoverUrl-=> $trendingDayWeekResponse');
      if (trendingDayWeekResponse.statusCode == 200) {
        var tempData = jsonDecode(trendingDayWeekResponse.body);

        List<dynamic> trendingWeekJson = tempData['results'];

        for (var i = 0; i < trendingWeekJson.length; i++) {
          trendingweek.add({
            "id": trendingWeekJson[i]['id'],
            "poster_path": trendingWeekJson[i]['poster_path'],
            "vote_average": trendingWeekJson[i]['vote_average'],
            "vote_count": trendingWeekJson[i]['vote_count'],
            "adult": trendingWeekJson[i]['adult'],
            "backdrop_path": trendingWeekJson[i]['backdrop_path'],
            "title": trendingWeekJson[i]['title'],
            "original_language": trendingWeekJson[i]['original_language'],
            "original_title": trendingWeekJson[i]['original_title'],
            "overview": trendingWeekJson[i]['overview'],
            "media_type": trendingWeekJson[i]['media_type'],
            "popularity": trendingWeekJson[i]['popularity'],
            "release_date": trendingWeekJson[i]['release_date'],
            "video": trendingWeekJson[i]['video'],
            'indexno': i,
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.black,
            toolbarHeight: 60,
            pinned: true,
            // To manage large appbar
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,

              // After save data management by future builder
              background: FutureBuilder(
                future: trandingListHome(uval),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CarouselSlider(
                      items: trendingweek.map((i) {
                        return Builder(builder: (BuildContext context) {
                          return GestureDetector(
                              onTap: () {
                                print('${i['poster_path']}');
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.3),
                                        BlendMode.darken,
                                      ),
                                      image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${i['poster_path']}'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10, bottom: 6),
                                                child: Text(
                                                  ' # '
                                                  '${i['indexno'] + 1}',
                                                  style: TextStyle(
                                                      color: Colors.amber
                                                          .withOpacity(0.7),
                                                      fontSize: 18),
                                                ),
                                              ),
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 8, bottom: 5),
                                                  width: 90,
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  8))),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        //rating icon
                                                        const Icon(Icons.star,
                                                            color: Colors.amber,
                                                            size: 20),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                            '${i['vote_average']}',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400))
                                                      ]))
                                            ])
                                      ])));
                        });
                      }).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        height: MediaQuery.of(context).size.height,
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  }
                },
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Trending' ' 🔥',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 16),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DropdownButton(
                      autofocus: true,
                      underline:
                          Container(height: 0, color: Colors.transparent),
                      dropdownColor: Colors.black.withOpacity(0.6),
                      onChanged: (value) {
                        setState(() {
                          trendingweek.clear();
                          uval = int.parse(value.toString());
                        });
                      },
                      value: uval,
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Colors.amber,
                        size: 30,
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text(
                            'Weekly',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text(
                            'Daily',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text(
                            'Discover',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const Center(
              child: Text('Sample Text'),
            )
          ]))
        ],
      ),
    );
  }
}
