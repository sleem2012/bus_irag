class CountryCodesModel {
  String? status;
  Map<String, CountryModel>? data;
  String? message;

  CountryCodesModel({this.status, this.data, this.message});

  CountryCodesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = {};
      json['data'].forEach((key, value) {
        data![key] = CountryModel.fromJson(value);
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((key, value) => MapEntry(key, value.toJson()));
    }
    data['message'] = message;
    return data;
  }
}
class CountryModel {
  String? country;
  String? dialCode;

  CountryModel({this.country, this.dialCode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    dialCode = json['dial_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['dial_code'] = dialCode;
    return data;
  }
}
