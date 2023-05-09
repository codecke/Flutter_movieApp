// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote;
  const Description({
    Key? key,
    required this.name,
    required this.bannerurl,
    required this.description,
    required this.vote,
    required this.posterurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: textModify(
                      color: Colors.white,
                      text: ' ⭐ Average rating - ' + vote,
                      size: 19,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: textModify(
                text: name != null ? name : 'Not Loaded',
                color: Colors.white,
                size: 20,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 100,
                  height: 200,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: textModify(
                      text: description,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
