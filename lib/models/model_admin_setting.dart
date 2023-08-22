class ModelAdminSetting {
  bool? status;
  String? message;
  Data? data;

  ModelAdminSetting({this.status, this.message, this.data});

  ModelAdminSetting.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic minDeposit;
  dynamic minWithdrow;
  dynamic referBonus;

  Data({this.minDeposit, this.minWithdrow, this.referBonus});

  Data.fromJson(Map<String, dynamic> json) {
    minDeposit = json['min_deposit'];
    minWithdrow = json['min_withdrow'];
    referBonus = json['refer_bonus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min_deposit'] = this.minDeposit;
    data['min_withdrow'] = this.minWithdrow;
    data['refer_bonus'] = this.referBonus;
    return data;
  }
}
