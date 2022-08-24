class PlantDetailsModel {
  String?  type;
  String?  message;
  PlantDetailsData?  data;

  PlantDetailsModel({this.type, this.message, this.data});

  PlantDetailsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? PlantDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PlantDetailsData {
  String?  productId;
  String?  name;
  String?  description;
  String?  imageUrl;
  String?  type;
  int?  price;
  bool?  available;
  Plant?  plant;

  PlantDetailsData(
      {this.productId,
        this.name,
        this.description,
        this.imageUrl,
        this.type,
        this.price,
        this.available,
        this.plant,
        });

  PlantDetailsData.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    plant = json['plant'] != null  ? Plant.fromJson(json['plant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['type'] = type;
    data['price'] = price;
    data['available'] = available;
    if (plant != null) {
      data['plant'] = plant!.toJson();
    }
    return data;
  }
}

class Plant {
  String?  plantId;
  String?  name;
  String?  description;
  String?  imageUrl;
  int?  waterCapacity;
  int?  sunLight;
  int?  temperature;

  Plant(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  Plant.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
