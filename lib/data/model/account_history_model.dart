class AccountHistoryModel {
  AccountData? data;

  AccountHistoryModel({this.data});

  AccountHistoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? AccountData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AccountData {
  List<InnerAccountData>? innerData;

  AccountData({this.innerData});

  AccountData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      innerData = <InnerAccountData>[];
      json['data'].forEach((v) {
        innerData!.add(InnerAccountData.fromJson(v));
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

class InnerAccountData {
  int? id;
  int? userId;
  String? route;
  int? passengerNumbers;
  int? amount;
  String? type;
  String? createdAt;

  InnerAccountData(
      {this.id,
      this.userId,
      this.route,
      this.passengerNumbers,
      this.amount,
      this.type,
      this.createdAt});

  InnerAccountData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    route = json['route'];
    passengerNumbers = json['passenger_numbers'];
    amount = json['amount'];
    type = json['type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['route'] = route;
    data['passenger_numbers'] = passengerNumbers;
    data['amount'] = amount;
    data['type'] = type;
    data['created_at'] = createdAt;
    return data;
  }
}
