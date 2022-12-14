class ToolsModel {
  String?  type;
  String?  message;
  List<ToolsData>?  toolsData;

  ToolsModel({this.type, this.message, this.toolsData});

  ToolsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      toolsData = <ToolsData>[];
      json['data'].forEach((v) {
        toolsData!.add(ToolsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    if (toolsData != null) {
      data['data'] = toolsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToolsData {
  String?  toolId;
  String?  name;
  String?  description;
  String?  imageUrl;

  ToolsData({this.toolId, this.name, this.description, this.imageUrl});

  ToolsData.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['toolId'] = toolId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
