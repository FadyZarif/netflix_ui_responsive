import 'package:flutter/material.dart';

import '../models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList({Key? key,
    required this.title,
    required this.contentList,
    this.isOriginals = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: isOriginals ? 500 : 220,
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: isOriginals ? 400 : 200,
                  width: isOriginals ? 200 : 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(contentList[i].imageUrl),
                          fit: BoxFit.cover),

                  ),
                );
              }
          ),
        )
      ]),
    );
  }
}
