class WalletAmountModel {
  WalletAmountData? data;

  WalletAmountModel({this.data});

  WalletAmountModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? WalletAmountData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class WalletAmountData {
  int? id;
  int? userId;
  String? amount;
  String? debtBalance;
  String? creditLimit;
  String? createdAt;

  WalletAmountData(
      {this.id,
        this.userId,
        this.amount,
        this.debtBalance,
        this.creditLimit,
        this.createdAt});

  WalletAmountData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    debtBalance = json['debt_balance'];
    creditLimit = json['credit_limit'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['debt_balance'] = this.debtBalance;
    data['credit_limit'] = this.creditLimit;
    data['created_at'] = this.createdAt;
    return data;
  }
}
