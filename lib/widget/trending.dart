// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const textModify(
            text: 'Trending Movies',
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: trending[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          description: trending[index]['overview'],
                          // launch_on: trending[index]['first-air-date'],
                          vote: trending[index]['vote_average'].toString(),
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                        ),
                      ),
                    );
                  },
                  child: trending[index]['title'] != null
                      ? Container(
                          padding: const EdgeInsets.all(5),
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: textModify(
                                  text: trending[index]['title'] != null
                                      ? trending[index]['title']
                                      : 'loading',
                                  color: Colors.white,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
