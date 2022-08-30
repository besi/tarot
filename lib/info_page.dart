import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {

  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About this App'),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          ListTile(
            title: Text('Credits'),
            subtitle: Text(''),
          ),
          ListTile(
            title: Text('Credits'),
            subtitle: Text(''),
          ),
          ListTile(
            title: Text('Credits'),
            subtitle: Text(''),
          ),
        ],
      ),
    );
  }
}
