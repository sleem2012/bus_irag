class SeatsModel {
  String? status;
  SeatsData? data;
  String? message;

  SeatsModel({this.status, this.data, this.message});

  SeatsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? SeatsData.fromJson(json['data']) : null;
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

class SeatsData {
  FleetType? fleetType;
  List<Seats>? seats;

  SeatsData({this.fleetType, this.seats});

  SeatsData.fromJson(Map<String, dynamic> json) {
    fleetType = json['fleetType'] != null
        ? FleetType.fromJson(json['fleetType'])
        : null;
    if (json['seats'] != null) {
      seats = <Seats>[];
      json['seats'].forEach((v) {
        seats!.add(Seats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fleetType != null) {
      data['fleetType'] = fleetType!.toJson();
    }
    if (seats != null) {
      data['seats'] = seats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FleetType {
  String? name;
  String? seatLayout;
  int? deck;
  List<String>? deckSeats;

  FleetType({this.name, this.seatLayout, this.deck, this.deckSeats});

  FleetType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    seatLayout = json['seat_layout'];
    deck = json['deck'];
    deckSeats = json['deck_seats'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['seat_layout'] = seatLayout;
    data['deck'] = deck;
    data['deck_seats'] = deckSeats;
    return data;
  }
}

class Seats {
  int? id;
  String? name;
  int? price;

  Seats({this.id, this.name, this.price});

  Seats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
