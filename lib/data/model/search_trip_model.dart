class TripSearchModel {
  String? status;
  SearchData? data;
  String? message;

  TripSearchModel({this.status, this.data, this.message});

  TripSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
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

class SearchData {
  List<InnerSearchData>? innerData;

  SearchData({this.innerData});

  SearchData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      innerData = <InnerSearchData>[];
      json['data'].forEach((v) {
        innerData!.add(InnerSearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (innerData != null) {
      data['data'] = innerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InnerSearchData {
  int? id;
  String? title;
  String? seatLayout;
  String? fleetType;
  String? startDate;
  String? endDate;
  String? pickup;
  String? destination;
  String? amount;
  List<String>? facilities;
  String? createdAt;

  InnerSearchData(
      {this.id,
      this.title,
      this.seatLayout,
      this.fleetType,
      this.startDate,
      this.endDate,
      this.pickup,
      this.destination,
      this.amount,
      this.facilities,
      this.createdAt});

  InnerSearchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title '];
    seatLayout = json['seat_layout'];
    fleetType = json['fleet_type'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    pickup = json['pickup'];
    destination = json['destination'];
    amount = json['amount'];
    facilities = json['facilities'].cast<String>();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title '] = title;
    data['seat_layout'] = seatLayout;
    data['fleet_type'] = fleetType;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['pickup'] = pickup;
    data['destination'] = destination;
    data['amount'] = amount;
    data['facilities'] = facilities;
    data['created_at'] = createdAt;
    return data;
  }
}
