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
  String? passengerPhone;
  String? passengerName;
  num? amount;
  num? creditor;
  num? debtor;
  num? total;
  String? type;
  String? createdAt;

  InnerAccountData(
      {this.id,
        this.userId,
        this.route,
        this.passengerNumbers,
        this.passengerPhone,
        this.passengerName,
        this.amount,
        this.creditor,
        this.debtor,
        this.total,
        this.type,
        this.createdAt});

  InnerAccountData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    route = json['route'];
    passengerNumbers = json['passenger_numbers'];
    passengerPhone = json['passenger_phone'];
    passengerName = json['passenger_name'];
    amount = json['amount'];
    creditor = json['creditor'];
    debtor = json['debtor'];
    total = json['total'];
    type = json['type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['route'] = route;
    data['passenger_numbers'] = passengerNumbers;
    data['passenger_phone'] = passengerPhone;
    data['passenger_name'] = passengerName;
    data['amount'] = amount;
    data['creditor'] = creditor;
    data['debtor'] = debtor;
    data['total'] = total;
    data['type'] = type;
    data['created_at'] = createdAt;
    return data;
  }
}



