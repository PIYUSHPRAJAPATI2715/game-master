import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:game/models/autowinner_model.dart';
import 'package:game/models/current_bit_time.dart';
import 'package:game/resourses/api_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../resourses/helper.dart';

class BitTimeController extends GetxController {
  CurrentBitTimeData timeData = CurrentBitTimeData();
  final currentTime = 0.obs;
  final getTimerr = false.obs;
  final winnerType = "".obs;
  @override
  void onInit() {
    super.onInit();
    GetBitTime();
  }

  Future<void> GetBitTime() async {
    getTimerr.value = false;

    http.Response response = await http.get(
      Uri.parse(ApiUrls.bitTime),
      headers: await getAuthHeader(),
    );
    log("currant-bet-timing ${response.body}");
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
    //     headers: await getAuthHeader(),body: jsonEncode(map) );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      CurrentBitTime res = CurrentBitTime.fromJson(jsonDecode(response.body));
      timeData = res.data!;
      currentTime.value = res.data!.timeLeft!;
      getTimerr.value = true;
      update();
      setTime();
    } else {
      getTimerr.value = false;
      update();
      print(jsonDecode(response.body));
    }
  }

  void setTime() {
    if (currentTime.value > 0) {
      Future.delayed(Duration(seconds: 1), () {
        currentTime.value--;
        update();
        setTime();
        log(currentTime.value.toString());
      });
      if (currentTime.value == 5) {
        Autowinner();
        log("5 scound Later only");
      }
    }
  }

  Future<void> Autowinner() async {
    winnerType.value = "";
    http.Response response = await http.post(Uri.parse(ApiUrls.autoWinner),
        headers: await getAuthHeader(),
        body: jsonEncode({"bet_id": timeData.id}));
    log("Auto Winner ${response.body}");
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
    //     headers: await getAuthHeader(),body: jsonEncode(map) );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      autowinnerModel res = autowinnerModel.fromJson(jsonDecode(response.body));
      winnerType.value = res.data!;
      update();

      // return ModelRegistor.fromJson(jsonDecode(response.body));
    } else {
      getTimerr.value = false;
      update();
      print(jsonDecode(response.body));
    }
  }
}
