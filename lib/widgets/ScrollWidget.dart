import 'package:flutter/material.dart';
import 'package:movie_reviewer/utils/utils.dart';

import '../Screens/DescriptionScreen.dart';

class ScrollWidget extends StatelessWidget {
  final List nameLists;
  final String title;
  final String name;
  const ScrollWidget({super.key, required this.nameLists, required this.title, required this.name});
  @override
  Widget build(BuildContext context) {
    // print(nameLists.length);
    // for (int i = 0; i < nameLists.length; i++) {
    //   print(nameLists[i]);
    // }
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modifiedText(
            text: title,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: nameLists.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(
                        name: nameLists[index]['original_title'],
                        description: nameLists[index]['overview'],
                        bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                            nameLists[index]['backdrop_path'],
                        posterUrl: 'https://image.tmdb.org/t/p/w500' +
                            nameLists[index]['poster_path'],
                        vote:nameLists[index]['vote_average'],
                        launch_on: nameLists[index]['release_date'])));
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
                                      nameLists[index]['poster_path']),
                            ),
                          ),
                        ),
                        Expanded(
                          child: modifiedText(
                            text: nameLists[index][name],
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
