import 'dart:convert';
import "dart:math";

import 'package:flutter/material.dart';

import 'tarot.dart';
import 'detail.dart';
import 'info_page.dart';

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
  Map? tarotData;

  void showDetail(identifier, data) {
    var tarot = Tarot.fromJson(identifier, data);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Detail(tarot)),
    );
  }

  void _cardSelected(String identifier) {
    setState(() {
      print(identifier);
      var index = images.indexOf(identifier);
      var data = tarotData!['tarot_interpretations'][index];
      showDetail(identifier, data);
    });
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
          _cardSelected(image);
        });
  }

  makeImages() {
    return images.map((path) => makeImage(path)).toList();
  }

  showInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InfoPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var jsonFuture = DefaultAssetBundle.of(context)
        .loadString('data/tarot_interpretations.json');
    jsonFuture.then((json) => tarotData = jsonDecode(json));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: showInfo,
          icon: const Icon(
            Icons.info,
            color: Colors.white,
          ),
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.auto_fix_high,
              color: Colors.white,
            ),
            onPressed: () {
              var list = tarotData!['tarot_interpretations'];
              var index = Random().nextInt(list.length);
              showDetail(images[index], list[index]);
            },
          )
        ],
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
