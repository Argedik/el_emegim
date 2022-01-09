import 'package:flutter/material.dart';

import 'card_counter.dart';


class FavoriButonveSayac extends StatelessWidget {
  const FavoriButonveSayac({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CartCounter(),
        Container(
          padding: EdgeInsets.all(2.0),
          child: Image.asset("assets/materials/Argedik_logo.png"),
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
