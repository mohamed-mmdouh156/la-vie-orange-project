class HomeModel {
  HomeModel({
    required this.seedId,
    required this.name,
    required this.description,
    this.imageUrl,
  });
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  HomeModel.fromJson(Map<String, dynamic> json){
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['seedId'] = seedId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}