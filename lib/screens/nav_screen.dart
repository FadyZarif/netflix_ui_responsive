import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/cubits/cubits.dart';
import 'package:netflix_ui/screens/home_screen.dart';
import 'package:netflix_ui/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const List<Widget> _screens =  [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  static const List<BottomNavigationBarItem> _items =  [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
    BottomNavigationBarItem(icon: Icon(Icons.queue_play_next),label: 'Coming Soon'),
    BottomNavigationBarItem(icon: Icon(Icons.file_download),label: 'Downloads'),
    BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'More'),
  ];
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: !Responsive.isDesktop(context)? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _items,
        onTap: (i){
          setState(() {

          });
          _currentIndex = i;
        },
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.white,
        unselectedFontSize: 11,
        selectedFontSize: 11,
        iconSize: 30,
      )
      : SizedBox(),
      body: BlocProvider(
        create: (context)=>AppBarCubit(),
          child: _screens[_currentIndex]),
    );
  }
}
