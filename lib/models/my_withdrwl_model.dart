class ModelMyWithdrawl {
  bool? status;
  String? message;
  List<Data>? data;

  ModelMyWithdrawl({this.status, this.message, this.data});

  ModelMyWithdrawl.fromJson(Map<String, dynamic> json) {
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
  dynamic status;
  dynamic amount;
  dynamic withdrawalUpiId;
  dynamic withdrawalDate;

  Data(
      {this.id,
        this.title,
        this.status,
        this.amount,
        this.withdrawalUpiId,
        this.withdrawalDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    amount = json['amount'];
    withdrawalUpiId = json['withdrawal_upi_id'];
    withdrawalDate = json['withdrawal_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['withdrawal_upi_id'] = this.withdrawalUpiId;
    data['withdrawal_date'] = this.withdrawalDate;
    return data;
  }
}
