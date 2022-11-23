import 'package:flutter/material.dart';
import 'package:netflix_ui/widgets/widgets.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({Key? key, this.scrollOffset = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}


class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(image: AssetImage(Assets.netflixLogo0)),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(text: 'TV Shows', onTap: (){}),
                _AppBarButton(text: 'Movies', onTap: (){}),
                _AppBarButton(text: 'My List', onTap: (){}),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(image: AssetImage(Assets.netflixLogo1)),
          SizedBox(
            width: 12,
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(text: 'Home', onTap: (){}),
                _AppBarButton(text: 'TV Shows', onTap: (){}),
                _AppBarButton(text: 'Movies', onTap: (){}),
                _AppBarButton(text: 'My List', onTap: (){}),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.search,color: Colors.white,size: 24,),
                _AppBarButton(text: 'KIDS', onTap: (){}),
                _AppBarButton(text: 'DVD', onTap: (){}),
                Icon(Icons.card_giftcard,color: Colors.white,size: 24,),
                Icon(Icons.notifications  ,color: Colors.white,size: 24,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const _AppBarButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}



