import 'package:flutter/material.dart';
import 'tarot.dart';
import 'fullscreen.dart';
import 'string_extensions.dart';

class Detail extends StatelessWidget {
  final Tarot card;

  const Detail(this.card, {Key? key}) : super(key: key);

  void imageTapped(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Fullscreen(card)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name.toTitleCase()),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          TextButton(
            onPressed: () {
              imageTapped(context);
            },
            child: Image.asset(
              'images/' + card.image + '.png',
              fit: BoxFit.fitHeight,
              alignment: Alignment.topRight,
              width: 200,
            ),
          ),
          ListTile(
            title: Text('Keywords'),
            subtitle: Text(card.keywords.join(", ")),
          ),
          ListTile(
            title: Text('Fortune telling'),
            subtitle: Text(card.fortune.join("\n")),
          ),
          ListTile(
            title: Text('Light'),
            subtitle: Text(card.light.join("\n")),
          ),
          ListTile(
            title: Text('Shadow'),
            subtitle: Text(card.shadow.join("\n")),
          ),
        ],
      ),
    );
  }
}
