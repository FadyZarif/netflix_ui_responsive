import 'package:flutter/material.dart';

import '../models/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  const Previews({Key? key, required this.title, required this.contentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(title,style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        Container(
          height: 165,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 8),
            scrollDirection: Axis.horizontal,

            itemCount: contentList.length,
            itemBuilder: (context,i){
              return GestureDetector(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(contentList[i].imageUrl),fit: BoxFit.cover),
                        shape: BoxShape.circle,
                        border: Border.all(color: contentList[i].color!,width: 4)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.black87,Colors.black45,Colors.transparent],
                        stops: [0,0.25,1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: contentList[i].color!,width: 4)
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: SizedBox(height: 60,child: Image.asset(contentList[i].titleImageUrl!),),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
