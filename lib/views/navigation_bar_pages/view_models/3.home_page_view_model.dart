
import 'package:el_emegim/views/navigation_bar_pages/view_models/home_body/product_details.dart';
import 'package:flutter/material.dart';

class HomePageDetails extends StatefulWidget {
  final String description, product, image;
  final int id;
  final Color renk;

  const HomePageDetails({
    Key? key,
    required this.description,
    required this.product,
    required this.image,
    required this.renk,
    required this.id,
  }) : super(key: key);

  @override
  _HomePageDetailsState createState() => _HomePageDetailsState();
}

class _HomePageDetailsState extends State<HomePageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.renk,
      appBar: buildAppBar(context),
      body: ProductDetails(
        image: widget.image,
        renk: widget.renk,
        description: widget.description,
        product: widget.product,
        id: widget.id,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: widget.renk,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        iconSize: 35.0,
        color: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(icon: Icon(Icons.bookmark), onPressed: () {}),
      ],
    );
  }
}
