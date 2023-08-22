import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/get_current_betting.dart';
import '../models/model_get_profile.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<GetCurrentBattingModel> getBettingRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.getCurrentBetting),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {

      return GetCurrentBattingModel.fromJson(jsonDecode(response.body));
    } else {

      return GetCurrentBattingModel(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return GetCurrentBattingModel(message: e.toString(), data: null,status: false);
  }
}
