class GetCurrentBattingModel {
  bool? status;
  String? message;
  Data? data;

  GetCurrentBattingModel({this.status, this.message, this.data});

  GetCurrentBattingModel.fromJson(Map<String, dynamic> json) {
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
  dynamic startTime;
  dynamic endTime;
  dynamic isRunning;
  dynamic isFinished;
  dynamic result;
  dynamic createdAt;
  dynamic updatedAt;

  Data(
      {this.id,
        this.startTime,
        this.endTime,
        this.isRunning,
        this.isFinished,
        this.result,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isRunning = json['is_running'];
    isFinished = json['is_finished'];
    result = json['result'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_running'] = this.isRunning;
    data['is_finished'] = this.isFinished;
    data['result'] = this.result;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
