import 'package:flutter/material.dart';
import 'package:movie_reviewer/Screens/DescriptionScreen.dart';
import 'package:movie_reviewer/utils/utils.dart';

class TvShows extends StatelessWidget {
  final List tvLists;
  const TvShows({super.key, required this.tvLists});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(
            text: "TV Shows",
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvLists.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                            name: tvLists[index]['name'],
                            description: tvLists[index]['overview'],
                            bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                                tvLists[index]['backdrop_path'],
                            posterUrl: 'https://image.tmdb.org/t/p/w500' +
                                tvLists[index]['poster_path'],
                            vote: tvLists[index]['vote_average'],
                            launch_on: tvLists[index]['first_air_date']),
                      ),
                    );
                  },
                  child: Container(
                    width: 160,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/' +
                                      tvLists[index]['poster_path']),
                            ),
                          ),
                        ),
                        Expanded(
                          child: modifiedText(
                            text: tvLists[index]['name'],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
