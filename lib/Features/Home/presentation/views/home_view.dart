import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Features/Home/presentation/views/search_view.dart';
import 'package:movies_app/Features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:movies_app/Features/movies/presentation/views/movie_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final screens = <Widget>[HomeViewBody(), MoviesView(), SearchView()];
  int index = 0;
  final items = <Widget>[
    Icon(Icons.home, size: 35),
    Icon(Icons.movie, size: 35),
    Icon(Icons.search, size: 35),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: Theme(
          data: Theme.of(
            context,
          ).copyWith(iconTheme: IconThemeData(color: Colors.black)),
          child: CurvedNavigationBar(
            // key: navigationKey,
            items: items,
            height: 50,
            color: Colors.grey,
            buttonBackgroundColor: Colors.blueGrey,
            backgroundColor: Colors.transparent,
            index: index,
            animationCurve: Curves.easeInOut,
            // animationDuration: Duration(microseconds: 600),
            onTap:
                (index) => setState(() {
                  this.index = index;
                }),
          ),
        ),
      ),
    );
  }
}
