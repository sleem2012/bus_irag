// ignore_for_file: public_member_api_docs, sort_constructors_first
class SentTripSearchModel {
  String? pickup;
  String? destination;
  String? type;
  String? goDate;
  String? backDate;

  SentTripSearchModel({
    this.pickup,
    this.destination,
    this.type,
    this.goDate,
    this.backDate,
  });

  SentTripSearchModel.fromJson(Map<String, dynamic> json) {
    pickup = json['pickup'];
    destination = json['destination'];
    type = json['type'];
    goDate = json['go_date'];
    backDate = json['back_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pickup'] = pickup;
    data['destination'] = destination;
    data['type'] = type;
    data['go_date'] = goDate;
    data['back_date'] = backDate;
    return data;
  }

  SentTripSearchModel copyWith({
    String? pickup,
    String? destination,
    String? type,
    String? goDate,
    String? backDate,
  }) {
    return SentTripSearchModel(
      pickup: pickup ?? this.pickup,
      destination: destination ?? this.destination,
      type: type ?? this.type,
      goDate: goDate ?? this.goDate,
      backDate: backDate ?? this.backDate,
    );
  }
}
