import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/cubits/cubits.dart';
import 'package:netflix_ui/data/data.dart';
import 'package:netflix_ui/widgets/widgets.dart';
import 'package:bloc/bloc.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  ScrollController _scrollController = ScrollController();

  double _scrollOffset = 0;

  @override
  void initState() {

    _scrollController = ScrollController()
      ..addListener(() {
        AppBarCubit cubit = AppBarCubit.get(context);
        cubit.setOffset(_scrollController.offset);
        // context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () {},
      ),
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: BlocConsumer<AppBarCubit,double>(
              listener: (context,scrollOffset){},
              builder:(context,scrollOffset)=> CustomAppBar(scrollOffset: scrollOffset))),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(padding: EdgeInsetsDirectional.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: PageStorageKey('previews'),
                title: 'Previews',
                contentList: previews
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: PageStorageKey('myList'),
            child: ContentList(
              title: 'My List',
              contentList: myList
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: PageStorageKey('originals'),
                title: 'Netflix Originals',
                contentList: originals,
                isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsetsDirectional.only(bottom: 20),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                  key: PageStorageKey('trending'),
                  title: 'Trending',
                  contentList: trending
              ),
            ),
          ),
        ],
      ),
    );
  }
}
