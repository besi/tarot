class Tarot {
  //Constructor
  final String image;
  late String name;
  late Object rank;
  late String suit;
  late List<String> light;
  late List<String> shadow;
  late List<String> keywords;
  late List<String> fortune;

  Tarot.fromJson(String this.image, Map json) {
    name = json['name'];
    rank = json['rank'];
    suit = json['suit'];
    light = json['meanings']['light'].toList().cast<String>();
    shadow = json['meanings']['shadow'].toList().cast<String>();
    keywords = json['keywords'].toList().cast<String>();
    fortune = json['fortune_telling'].toList().cast<String>();
  }
}
