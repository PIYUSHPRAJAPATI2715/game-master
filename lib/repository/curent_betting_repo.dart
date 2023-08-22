import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/curent_betting_model.dart';
import '../models/model_update_profile.dart';
import '../models/model_user_bet.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<CurrentBattingModel> currentBetRepo({id,result,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  Map map = <String, dynamic>{};
  map['id'] = id;
  map['result'] = result;

  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.CurrentBetting),
        headers: await getAuthHeader(),
        body: jsonEncode(map)
    );
    print(response.body);
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),


    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      return CurrentBattingModel.fromJson(jsonDecode(response.body));

    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return CurrentBattingModel.fromJson(jsonDecode(response.body));
    }
  }  catch (e) {
    print(e.toString());
    return CurrentBattingModel(message: e.toString(), status: false,);
  }
}