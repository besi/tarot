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
          title: Text(card.name.toCapitalized()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return ListTile(
                      title: Text('Light'),
                      subtitle: Text(card.light.join("\n")),
                    );
                  } else if (index == 1) {
                    return ListTile(
                      title: Text('Shadow'),
                      subtitle: Text(card.shadow.join("\n")),
                    );
                  } else if (index == 2) {
                    return ListTile(
                      title: Text('Keywords'),
                      subtitle: Text(card.light.join("\n")),
                    );
                  } else if (index == 3) {
                    return ListTile(
                      title: Text('Fortune telling'),
                      subtitle: Text(card.fortune.join("\n")),
                    );
                  } else {
                    return Text('');
                  }
                },
              ),
            ],
          ),
        ));
  }
}
