// ignore_for_file: public_member_api_docs, sort_constructors_first
class SentTripSearchModel {
  String? pickup;
  String? destination;
  String? type;
  String? goDate;
  String? backDate;
  String? fleetType;

  SentTripSearchModel({
    this.pickup,
    this.destination,
    this.type,
    this.goDate,
    this.backDate,
    this.fleetType,
  });

  SentTripSearchModel.fromJson(Map<String, dynamic> json) {
    pickup = json['pickup'];
    destination = json['destination'];
    type = json['type'];
    goDate = json['go_date'];
    backDate = json['back_date'];
    fleetType = json['fleet_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickup'] = pickup;
    data['destination'] = destination;
    data['type'] = type;
    data['go_date'] = goDate;
    if(backDate!=null)  data['back_date'] = backDate;
    if(fleetType!=null)  data['fleet_type'] = fleetType;
    return data;
  }

  SentTripSearchModel copyWith({
    String? pickup,
    String? destination,
    String? type,
    String? goDate,
    String? backDate,
    String? fleetType,
  }) {
    return SentTripSearchModel(
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      type: type ?? this.type,
      goDate: goDate ?? this.goDate,
      backDate: backDate ?? this.backDate,
      fleetType: fleetType ?? this.fleetType,
    );
  }
}
