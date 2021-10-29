class Pokemon {
  int id;
  String number;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  bool isFavorite = false;

  Pokemon(this.id, this.number, this.name, this.img, this.type, this.height,
      this.weight, this.isFavorite);

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        number = json['num'],
        name = json['name'],
        img = json['img'],
        type = (json['type'] as List).map((e) => e.toString()).toList(),
        height = json['height'],
        weight = json['weight'];
}
