import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/model_admin_setting.dart';
import '../models/model_update_profile.dart';
import '../models/model_user_bet.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelAdminSetting> adminSettingRepo({min_deposit,min_withdrow,refer_bonus,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  Map map = <String, dynamic>{};
  map['min_deposit'] = min_deposit;
  map['min_withdrow'] = min_withdrow;
  map['refer_bonus'] = refer_bonus;

  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.adminSettings),
        headers: await getAuthHeader(),
        body: jsonEncode(map)
    );
    print(response.body);
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),


    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      return ModelAdminSetting.fromJson(jsonDecode(response.body));

    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelAdminSetting.fromJson(jsonDecode(response.body));
    }
  }  catch (e) {
    print(e.toString());
    return ModelAdminSetting(message: e.toString(), status: false,);
  }
}