

class FleetTypeModel {
  List<FleetTypeData>? data;

  FleetTypeModel({this.data});

  FleetTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FleetTypeData>[];
      json['data'].forEach((v) {
        data!.add(FleetTypeData.fromJson(v));
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

class FleetTypeData {
  int? id;
  String? name;
  String? seatLayout;
  int? numberDecks;
  List<String>? facilities;
  String? amount;
  String? createdAt;

  FleetTypeData(
      {this.id,
        this.name,
        this.seatLayout,
        this.numberDecks,
        this.facilities,
        this.amount,
        this.createdAt});

  FleetTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    seatLayout = json['seat_layout'];
    numberDecks = json['number_decks'];
    facilities = json['facilities'].cast<String>();
    amount = json['amount'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['seat_layout'] = seatLayout;
    data['number_decks'] = numberDecks;
    data['facilities'] = facilities;
    data['amount'] = amount;
    data['created_at'] = createdAt;
    return data;
  }
}
