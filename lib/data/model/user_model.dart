class UserModel {
  Value? value;

  UserModel({this.value});

  UserModel.fromJson(Map<String, dynamic> json) {
    value = json['Value'] != null ? Value.fromJson(json['Value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (value != null) {
      data['Value'] = value!.toJson();
    }
    return data;
  }
}

class Value {
  String? token;
  int? status;
  Context? context;

  Value({this.token, this.status, this.context});

  Value.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    status = json['Status'];
    context =
    json['Context'] != null ? Context.fromJson(json['Context']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Token'] = token;
    data['Status'] = status;
    if (context != null) {
      data['Context'] = context!.toJson();
    }
    return data;
  }
}

class Context {
  MobileAccount? mobileAccount;

  Context({this.mobileAccount});

  Context.fromJson(Map<String, dynamic> json) {
    mobileAccount = json['MobileAccount'] != null
        ? MobileAccount.fromJson(json['MobileAccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mobileAccount != null) {
      data['MobileAccount'] = mobileAccount!.toJson();
    }
    return data;
  }
}

class MobileAccount {
  String? name;
  String? operatorId;
  int? subId;
  String? id;
  bool? isConsumer;
  int? parentId;
  int? staffId;
  String? image;
  String? cISDivision;
  bool? checkPassword;
  bool? resetPassword;

  MobileAccount(
      {this.name,
        this.operatorId,
        this.subId,
        this.id,
        this.isConsumer,
        this.parentId,
        this.staffId,
        this.image,
        this.cISDivision,
        this.checkPassword,
        this.resetPassword});

  MobileAccount.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    operatorId = json['OperatorId'];
    subId = json['SubId'];
    id = json['Id'];
    isConsumer = json['IsConsumer'];
    parentId = json['ParentId'];
    staffId = json['StaffId'];
    image = json['Image'];
    cISDivision = json['CISDivision'];
    checkPassword = json['CheckPassword'];
    resetPassword = json['resetPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['OperatorId'] = operatorId;
    data['SubId'] = subId;
    data['Id'] = id;
    data['IsConsumer'] = isConsumer;
    data['ParentId'] = parentId;
    data['StaffId'] = staffId;
    data['Image'] = image;
    data['CISDivision'] = cISDivision;
    data['CheckPassword'] = checkPassword;
    data['resetPassword'] = resetPassword;
    return data;
  }
}
