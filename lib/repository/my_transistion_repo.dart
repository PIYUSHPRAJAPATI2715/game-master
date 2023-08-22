import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_get_profile.dart';
import '../models/model_my_transistion.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelMyTransistion> getTransRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.MyTransaction),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {

      return ModelMyTransistion.fromJson(jsonDecode(response.body));
    } else {

      return ModelMyTransistion(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelMyTransistion(message: e.toString(), data: null,status: false);
  }
}
