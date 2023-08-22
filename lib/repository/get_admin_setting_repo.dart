import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_admin_setting.dart';
import '../models/model_get_profile.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelAdminSetting> getAdminSettingRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.getAdmin),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {

      return ModelAdminSetting.fromJson(jsonDecode(response.body));
    } else {

      return ModelAdminSetting(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelAdminSetting(message: e.toString(), data: null,status: false);
  }
}
