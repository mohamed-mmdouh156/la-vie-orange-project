class CardModel {
  CardModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.available,
    this.seed,
    required this.plant,
    this.tool,
  });
  late final String productId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String type;
  late final int price;
  late final bool available;
  late final dynamic seed;
  late final Plant plant;
  late final dynamic tool;

  CardModel.fromJson(Map<String, dynamic> json){
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = null;
    plant = Plant.fromJson(json['plant']);
    tool = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['type'] = type;
    data['price'] = price;
    data['available'] = available;
    data['seed'] = seed;
    data['plant'] = plant.toJson();
    data['tool'] = tool;
    return data;
  }
}

class Plant {
  Plant({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });
  late final String plantId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final int waterCapacity;
  late final int sunLight;
  late final int temperature;

  Plant.fromJson(Map<String, dynamic> json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['plantId'] = plantId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['waterCapacity'] = waterCapacity;
    data['sunLight'] = sunLight;
    data['temperature'] = temperature;
    return data;
  }
}