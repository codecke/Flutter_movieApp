// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;
  const TV({
    Key? key,
    required this.tv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const textModify(
            text: 'Popular Tv Shows',
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 180,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: tv[index]['original_name'],
                            bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['backdrop_path'],
                            description: tv[index]['overview'],
                            // launch_on: tv[index]['first_air_date'],
                            vote: tv[index]['vote_average'].toString(),
                            posterurl: 'https://image.tmdb.org/t/p/w500' +
                                tv[index]['poster_path'],
                          ),
                        ),
                      );
                    },
                    child: tv[index]['original_name'] != null
                        ? Container(
                            padding: const EdgeInsets.all(5),
                            width: 250,
                            child: Column(
                              children: [
                                Container(
                                  width: 250,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            tv[index]['poster_path'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: textModify(
                                    text: tv[index]['original_name'] != null
                                        ? tv[index]['original_name']
                                        : 'loading',
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
