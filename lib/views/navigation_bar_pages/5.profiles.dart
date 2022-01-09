import 'package:el_emegim/views/navigation_bar_pages/view_models/5.profiles_page_view.dart';
import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Body(),
    );
  }
}