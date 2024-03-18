import 'fields_union/fields_union.dart';

class DynamicFieldsModel {
  String? status;
  List<DynamicFieldsData>? data;
  String? message;

  DynamicFieldsModel({this.status, this.data, this.message});

  DynamicFieldsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DynamicFieldsData>[];
      json['data'].forEach((v) {
        data!.add(DynamicFieldsData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class DynamicFieldsData {
  int? id;
  String? name;
  String? currency;
  Map<String, Parameter>? parameters;
  String? description;
  String? createdAt;

  DynamicFieldsData({
    this.id,
    this.name,
    this.currency,
    this.parameters,
    this.description,
    this.createdAt,
  });

  DynamicFieldsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    currency = json['currency'];
    if (json['parameters'] != null) {
      parameters = <String, Parameter>{};
      json['parameters'].forEach((k, v) {
        parameters![k] = Parameter.fromJson(v);
      });
    }
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['currency'] = currency;
    if (parameters != null) {
      data['parameters'] = parameters!.map((k, v) => MapEntry(k, v.toJson()));
    }
    data['description'] = description;
    data['created_at'] = createdAt;
    return data;
  }
}

class Parameter {
  String? fieldName;
  String? fieldLevel;
  DUIFieldsType? type;
  String? validation;

  Parameter({
    this.fieldName,
    this.fieldLevel,
    this.type,
    this.validation,
  });

  Parameter.fromJson(Map<String, dynamic> json) {
    fieldName = json['field_name'];
    fieldLevel = json['field_level'];
    type = DUIFieldsType.fromString(json['type']);
    validation = json['validation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field_name'] = fieldName;
    data['field_level'] = fieldLevel;
    data['type'] = type;
    data['validation'] = validation;
    return data;
  }
}
