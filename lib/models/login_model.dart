class ModelCommonResponse {
  bool? status;
  String? message;
  String? authToken;
  Data? data;

  ModelCommonResponse({this.status, this.message, this.authToken, this.data});

  ModelCommonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    authToken = json['auth_token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['auth_token'] = this.authToken;
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
 dynamic status;
 dynamic address;
 dynamic country;
 dynamic state;
 dynamic city;
 dynamic zipCode;
 dynamic profileImage;
 dynamic roleId;
 dynamic role;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.status,
        this.address,
        this.country,
        this.state,
        this.city,
        this.zipCode,
        this.profileImage,
        this.roleId,
        this.role});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    profileImage = json['profile_image'];
    roleId = json['role_id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['address'] = this.address;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['profile_image'] = this.profileImage;
    data['role_id'] = this.roleId;
    data['role'] = this.role;
    return data;
  }
}
