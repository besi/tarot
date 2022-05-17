import 'package:flutter/material.dart';
import 'tarot.dart';

class Fullscreen extends StatelessWidget {
  final Tarot card;

  const Fullscreen(this.card, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Image.asset(
          'images/' + card.image + '.png',
          fit: BoxFit.fitHeight,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
