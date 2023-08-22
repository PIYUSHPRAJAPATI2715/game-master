import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/model_add_withDrewl.dart';
import '../models/model_admin_setting.dart';
import '../models/model_update_profile.dart';
import '../models/model_user_bet.dart';
import '../models/model_withdrawl_update.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelWithdrawlUpdte> updatwWithdrawlRepo({status,id,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  Map map = <String, dynamic>{};
  map['status'] = status;
  map['id'] = id;

  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.withdrawalReqUpdate),
        headers: await getAuthHeader(),
        body: jsonEncode(map)
    );
    print(response.body);
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),


    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      return ModelWithdrawlUpdte.fromJson(jsonDecode(response.body));

    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelWithdrawlUpdte.fromJson(jsonDecode(response.body));
    }
  }  catch (e) {
    print(e.toString());
    return ModelWithdrawlUpdte(message: e.toString(), status: false,);
  }
}