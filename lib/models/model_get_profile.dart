class ModelGetProfile {
  bool? status;
  String? message;
  Data? data;

  ModelGetProfile({this.status, this.message, this.data});

  ModelGetProfile.fromJson(Map<String, dynamic> json) {
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
 dynamic id;
 dynamic name;
 dynamic email;
 dynamic phone;
 dynamic balance;
 dynamic referAmount;
 dynamic depositAmount;
 dynamic emailVerifiedAt;
 dynamic image;
 dynamic fcmToken;
 dynamic status;
 dynamic referCode;
 dynamic createdAt;
 dynamic updatedAt;
 dynamic deletedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.balance,
        this.referAmount,
        this.depositAmount,
        this.emailVerifiedAt,
        this.image,
        this.fcmToken,
        this.status,
        this.referCode,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    balance = json['balance'];
    referAmount = json['refer_amount'];
    depositAmount = json['deposit_amount'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    fcmToken = json['fcm_token'];
    status = json['status'];
    referCode = json['refer_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['balance'] = this.balance;
    data['refer_amount'] = this.referAmount;
    data['deposit_amount'] = this.depositAmount;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image'] = this.image;
    data['fcm_token'] = this.fcmToken;
    data['status'] = this.status;
    data['refer_code'] = this.referCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
