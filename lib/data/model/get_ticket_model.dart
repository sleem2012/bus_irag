class GetTicketModel {
  TicketData? data;

  GetTicketModel({this.data});

  GetTicketModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? TicketData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class TicketData {
  List<TicketInnerData>? innerData;

  TicketData({this.innerData});

  TicketData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      innerData = <TicketInnerData>[];
      json['data'].forEach((v) {
        innerData!.add(new TicketInnerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.innerData != null) {
      data['data'] = this.innerData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketInnerData {
  int? id;
  String? user;
  String? subTotal;
  String? pnrNumber;
  int? status;

  TicketInnerData({this.id, this.user, this.subTotal, this.pnrNumber, this.status});

  TicketInnerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    subTotal = json['sub_total'];
    pnrNumber = json['pnr_number'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['sub_total'] = this.subTotal;
    data['pnr_number'] = this.pnrNumber;
    data['status'] = this.status;
    return data;
  }
}
