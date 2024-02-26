class UserModel {
  Data? data;
  String? status;
  String? message;

  UserModel({this.data, this.status, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? username;
  String? mobile;
  String? countryCode;
  Address? address;
  int? status;
  int? type;
  String? token;

  Data(
      {this.id,
        this.username,
        this.mobile,
        this.countryCode,
        this.address,
        this.status,
        this.type,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username '];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    status = json['status'];
    type = json['type'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username '] = username;
    data['mobile'] = mobile;
    data['country_code'] = countryCode;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['status'] = status;
    data['type'] = type;
    data['token'] = token;
    return data;
  }
}

class Address {
  String? address;
  String? state;
  String? zip;
  String? country;
  String? city;

  Address({this.address, this.state, this.zip, this.country, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['state'] = state;
    data['zip'] = zip;
    data['country'] = country;
    data['city'] = city;
    return data;
  }
}

