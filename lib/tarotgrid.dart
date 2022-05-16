import 'dart:convert';

import 'package:flutter/material.dart';

class TarotGrid extends StatefulWidget {
  const TarotGrid({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked 'final'.

  final String title;

  @override
  State<TarotGrid> createState() => _TarotGridState();
}

class _TarotGridState extends State<TarotGrid> {
  int _counter = 0;
  Map? tarotData;

  void _cardSelected() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _imageTapped() {
    print("image tapped");
  }

  var images = [
    '00-the-fool',
    '01-the-magician',
    '02-the-high-priestess',
    '03-the-empress',
    '04-the-emperor',
    '05-the-hierophant',
    '06-the-lovers',
    '07-the-chariot',
    '08-strength',
    '09-the-hermit',
    '10-wheel-of-fortune',
    '11-justice',
    '12-the-hanged-man',
    '13-death',
    '14-temperance',
    '15-the-devil',
    '16-the-tower',
    '17-the-star',
    '18-the-moon',
    '19-the-sun',
    '20-judgement',
    '21-the-world',
    'wands-01',
    'wands-02',
    'wands-03',
    'wands-04',
    'wands-05',
    'wands-06',
    'wands-07',
    'wands-08',
    'wands-09',
    'wands-10',
    'wands-page',
    'wands-knight',
    'wands-queen',
    'wands-king',
    'cups-01',
    'cups-02',
    'cups-03',
    'cups-04',
    'cups-05',
    'cups-06',
    'cups-07',
    'cups-08',
    'cups-09',
    'cups-10',
    'cups-page',
    'cups-knight',
    'cups-queen',
    'cups-king',
    'swords-01',
    'swords-02',
    'swords-03',
    'swords-04',
    'swords-05',
    'swords-06',
    'swords-07',
    'swords-08',
    'swords-09',
    'swords-10',
    'swords-page',
    'swords-knight',
    'swords-queen',
    'swords-king',
    'pentacles-01',
    'pentacles-02',
    'pentacles-03',
    'pentacles-04',
    'pentacles-05',
    'pentacles-06',
    'pentacles-07',
    'pentacles-08',
    'pentacles-09',
    'pentacles-10',
    'pentacles-page',
    'pentacles-knight',
    'pentacles-queen',
    'pentacles-king',

  ];

  InkWell makeImage(String image) {
    return InkWell(
        child: Image.asset('images/thumbs/' + image + '.png', fit: BoxFit.fill),
        onTap: () {
          print(image);
          var index = images.indexOf(image);
          print(tarotData!['tarot_interpretations'][index]);

          // FIXME:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const SecondRoute()),
          // );
        });
  }

  makeImages() {
    return images.map((path) => makeImage(path)).toList();
  }

  @override
  Widget build(BuildContext context) {
    var jsonFuture = DefaultAssetBundle.of(context).loadString('data/tarot_interpretations.json');
    jsonFuture.then((json) => tarotData = jsonDecode(json));
    jsonFuture.whenComplete(() => print('loading done...'));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GridView.count(
          primary: false,
          childAspectRatio: .56,
          crossAxisCount: 3,
          children: makeImages(),
        ),
      ),
    );
  }
}
