import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:el_emegim/views/navigation_bar_pages/1.favorites.dart';
import 'package:el_emegim/views/navigation_bar_pages/2.peak.dart';
import 'package:el_emegim/views/navigation_bar_pages/3.home_page.dart';
import 'package:el_emegim/views/navigation_bar_pages/4.society.dart';
import 'package:el_emegim/views/navigation_bar_pages/5.profiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _page = 0;
  final
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final Favorites _favorites = Favorites();
  final Peak _peak = Peak();
  final HomePage _homePage = HomePage();
  final Society _society = Society();
  final Profiles _profiles = Profiles();
  Widget _showPage = HomePage();

  Widget? _pageChooser(int page){
    switch (page){
      case 0:
        return _favorites;
        break;
      case 1:
        return _peak;
        break;
      case 2:
        return _homePage;
        break;
      case 3:
        return _society;
        break;
      case 4:
        return _profiles;
        break;
      default:
        return Container(
          child: Center(
            child: Text("Sayfa bulunamadı"),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.bookmark, size: 30),
            Icon(Icons.addchart, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.people, size: 30),
            Icon(Icons.perm_contact_calendar_rounded, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int index) {
            setState(() {
              _showPage = _pageChooser(index)!;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: _showPage
          ),
        ));
  }
}
