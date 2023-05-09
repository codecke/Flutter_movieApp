// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List toprated;
  const TopRated({
    Key? key,
    required this.toprated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const textModify(
            text: 'Top Rated Movies',
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: toprated[index]['title'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          description: toprated[index]['overview'],
                          // launch_on: trending[index]['first-air-date'],
                          vote: toprated[index]['vote_average'].toString(),
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                        ),
                      ),
                    );
                  },
                  child: toprated[index]['title'] != null
                      ? Container(
                          width: 140,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          toprated[index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: textModify(
                                  text: toprated[index]['title'] != null
                                      ? toprated[index]['title']
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
