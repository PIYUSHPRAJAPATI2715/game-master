///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CurrentBitTimeData {
/*
{
  "id": 2,
  "time_left": 30
} 
*/

  int? id;
  int? timeLeft;

  CurrentBitTimeData({
    this.id,
    this.timeLeft,
  });
  CurrentBitTimeData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    timeLeft = json['time_left']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['time_left'] = timeLeft;
    return data;
  }
}

class CurrentBitTime {
/*
{
  "status": true,
  "message": "Success",
  "data": {
    "id": 2,
    "time_left": 30
  }
} 
*/

  bool? status;
  String? message;
  CurrentBitTimeData? data;

  CurrentBitTime({
    this.status,
    this.message,
    this.data,
  });
  CurrentBitTime.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message']?.toString();
    data = (json['data'] != null)
        ? CurrentBitTimeData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
