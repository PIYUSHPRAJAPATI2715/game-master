class ModelMyTransistion {
  bool? status;
  String? message;
  List<Data>? data;

  ModelMyTransistion({this.status, this.message, this.data});

  ModelMyTransistion.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic title;
  dynamic transType;
  dynamic status;
  dynamic transId;
  dynamic amount;
  dynamic transDate;

  Data(
      {this.id,
        this.title,
        this.transType,
        this.status,
        this.transId,
        this.amount,
        this.transDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    transType = json['trans_type'];
    status = json['status'];
    transId = json['trans_id'];
    amount = json['amount'];
    transDate = json['trans_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['trans_type'] = this.transType;
    data['status'] = this.status;
    data['trans_id'] = this.transId;
    data['amount'] = this.amount;
    data['trans_date'] = this.transDate;
    return data;
  }
}
