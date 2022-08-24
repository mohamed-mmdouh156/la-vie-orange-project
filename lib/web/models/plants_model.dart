class PlantsModel {
  String?  type;
  String?  message;
  List<PlantsData>?  plantsData;

  PlantsModel({this.type, this.message, this.plantsData});

  PlantsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      plantsData = <PlantsData>[];
      json['data'].forEach((v) {
        plantsData!.add(PlantsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    if (plantsData != null) {
      data['data'] = plantsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlantsData {
  String?  plantId;
  String?  name;
  String?  description;
  String?  imageUrl;
  int?  waterCapacity;
  int?  sunLight;
  int?  temperature;

  PlantsData(
      {this.plantId,
        this.name,
        this.description,
        this.imageUrl,
        this.waterCapacity,
        this.sunLight,
        this.temperature});

  PlantsData.fromJson(Map<String, dynamic> json) {
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
