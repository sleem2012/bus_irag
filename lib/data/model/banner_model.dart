class BannerModel {
  List<BannerData>? data;

  BannerModel({this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(BannerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerData {
  int? id;
  String? description;
  String? link;
  String? publishDate;
  String? image;
  String? createdAt;

  BannerData(
      {this.id,
        this.description,
        this.link,
        this.publishDate,
        this.image,
        this.createdAt});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description '];
    link = json['link'];
    publishDate = json['publish_date'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description '] = description;
    data['link'] = link;
    data['publish_date'] = publishDate;
    data['image'] = image;
    data['created_at'] = createdAt;
    return data;
  }
}
