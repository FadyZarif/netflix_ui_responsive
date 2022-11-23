import 'package:flutter/material.dart';
import 'package:netflix_ui/assets.dart';
import 'package:netflix_ui/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

import '../models/content_model.dart';

class ContentHeader extends StatelessWidget {
  final Content featuredContent;

  const ContentHeader({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _ContentHeaderMobile(featuredContent: featuredContent),
        desktop: _ContentHeaderDesktop(featuredContent: featuredContent));
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featuredContent;

  const _ContentHeaderMobile({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(featuredContent.imageUrl),
                  fit: BoxFit.cover)),
        ),
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
            bottom: 110,
            child: SizedBox(
              width: 250,
              child: Image.asset(featuredContent.titleImageUrl!),
            )),
        Positioned(
          right: 0,
          left: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _VerticalIconButton(
                  icon: Icons.add,
                  title: 'List',
                  onTap: () {
                    print('List');
                  }),
              const _PlayButton(),
              _VerticalIconButton(
                  icon: Icons.info_outline, title: 'Info', onTap: () {}),
            ],
          ),
        )
      ],
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  final Content featuredContent;

  const _ContentHeaderDesktop({Key? key, required this.featuredContent})
      : super(key: key);

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  VideoPlayerController? _videoPlayerController;

  bool _isMuted = false;

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((_) {
            setState(() {});
          })
          ..play();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _videoPlayerController!.value.isPlaying
            ? _videoPlayerController!.pause()
            : _videoPlayerController!.play();
      },
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          AspectRatio(
              aspectRatio: _videoPlayerController!.value.isInitialized ? _videoPlayerController!.value.aspectRatio  : 2.344,
            child: _videoPlayerController!.value.isInitialized ? VideoPlayer(_videoPlayerController!) :
            Image.asset(widget.featuredContent.imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: AspectRatio(
              aspectRatio: _videoPlayerController!.value.isInitialized ?
              _videoPlayerController!.value.aspectRatio : 2.344,
              child:  Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
            ),
          ),
          Positioned(
            left: 60,
            bottom: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(widget.featuredContent.titleImageUrl!),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.featuredContent.description!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(2, 4),
                            blurRadius: 6)
                      ]),
                ),
                Row(
                  children: [
                    const _PlayButton(),
                    const SizedBox(
                      width: 16,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      child: Row(
                        children: const [
                          Icon(Icons.info_outline),
                          Text(
                            'More Info',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    if (_videoPlayerController!.value.isInitialized)
                        IconButton(
                          color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _isMuted? _videoPlayerController!.setVolume(100) : _videoPlayerController!.setVolume(0);
                                _isMuted = _videoPlayerController!.value.volume == 0;
                              });
                            },
                            icon: _isMuted
                                ? Icon(Icons.volume_off)
                                : Icon(Icons.volume_up))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;

  const _VerticalIconButton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      padding: EdgeInsets.zero,
      minWidth: 0,
      onPressed: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      onPressed: () {},
      child: Row(
        children: [
          const Icon(
            Icons.play_arrow,
            color: Colors.black,
          ),
          const Text(
            'Play',
            style: TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
    );
  }
}
