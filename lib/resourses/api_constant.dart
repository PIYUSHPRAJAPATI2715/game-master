import 'dart:io';
import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources.dart';

class ApiUrls {
  static const String apiBaseUrl = 'http://65.0.196.189/api/';
  static const String login = "${apiBaseUrl}login";
  static const String register = "${apiBaseUrl}register";
  static const String getProfile = "${apiBaseUrl}my-profile";
  static const String getAdmin = "${apiBaseUrl}admin-settings";
  static const String AdminSetting = "${apiBaseUrl}admin-settings";
  static const String updateProfile = "${apiBaseUrl}update-profile";
  static const String userBet = "${apiBaseUrl}user-bet";
  static const String adminSettings = "${apiBaseUrl}admin-settings";
  static const String addWithdrawal = "${apiBaseUrl}add-withdrawal";
  static const String MyTransaction = "${apiBaseUrl}my-transaction";
  static const String withdrawalRequests = "${apiBaseUrl}withdrawal-requests";
  static const String withdrawalReqUpdate =
      "${apiBaseUrl}withdrawal-req-update";
  static const String bitTime = "${apiBaseUrl}currant-bet-timing";
  static const String autoWinner = "${apiBaseUrl}auto-winner";
  static const String getCurrentBetting = "${apiBaseUrl}currant-betting";
  static const String CurrentBetting = "${apiBaseUrl}currant-betting";
}

Future getAuthHeader() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  print(pref.getString("cookie")!.toString().replaceAll('\"', ''));
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    if (pref.getString("cookie") != null)
      HttpHeaders.authorizationHeader:
          'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',
  };
}
// HttpHeaders.contentTypeHeader:   'application/json',
// HttpHeaders.acceptHeader: 'application/json',
//     HttpHeaders.authorizationHeader: 'Bearer ${pref.getString("cookie")!.toString().replaceAll('\"', '')}',

showToast(message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppTheme.primaryColor,
      textColor: Color(0xffffffff),
      fontSize: 14);
}
