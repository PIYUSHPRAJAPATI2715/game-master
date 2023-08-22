import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/model_update_profile.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelProfileUpdate> updateProfileRepo({name,password,password_confirmation,old_password,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  Map map = <String, dynamic>{};
  map['name'] = name;
  map['password'] = password;
  map['password_confirmation'] = password_confirmation;
  map['old_password'] = old_password;
  print(map);
  try {
    http.Response response = await http.post(Uri.parse(ApiUrls.updateProfile),
        headers: await getAuthHeader(),
        body: jsonEncode(map)
    );
    print(response.body);
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),


    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      return ModelProfileUpdate.fromJson(jsonDecode(response.body));

    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelProfileUpdate.fromJson(jsonDecode(response.body));
    }
  }  catch (e) {
    print(e.toString());
    return ModelProfileUpdate(message: e.toString(), status: false,);
  }
}