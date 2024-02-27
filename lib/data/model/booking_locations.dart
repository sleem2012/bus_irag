class BookingLocations {
  String? status;
  LocationsData? data;
  String? message;

  BookingLocations({this.status, this.data, this.message});

  BookingLocations.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? LocationsData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class LocationsData {
  List<LocationInnerData>? data;

  LocationsData({
    this.data,
  });

  LocationsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LocationInnerData>[];
      json['data'].forEach((v) {
        data!.add(LocationInnerData.fromJson(v));
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

class LocationInnerData {
  int? id;
  String? name;
  String? createdAt;

  LocationInnerData({this.id, this.name, this.createdAt});

  LocationInnerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    return data;
  }
}
