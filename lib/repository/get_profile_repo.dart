import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_get_profile.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelGetProfile> getProfileRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.getProfile),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {

      return ModelGetProfile.fromJson(jsonDecode(response.body));
    } else {

      return ModelGetProfile(
          message: jsonDecode(response.body)["message"],
status: false,
          data: null);
    }
  } catch (e) {
    return ModelGetProfile(message: e.toString(), data: null,status: false);
  }
}
