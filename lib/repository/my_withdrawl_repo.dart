import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/model_get_profile.dart';
import '../models/model_my_transistion.dart';
import '../models/my_withdrwl_model.dart';
import '../resourses/api_constant.dart';
import '../resourses/helper.dart';

Future<ModelMyWithdrawl> getWithdrawRepo() async {
  try {
    http.Response response = await http.get(
      Uri.parse(ApiUrls.withdrawalRequests),
      headers: await getAuthHeader(),
    );

    if (response.statusCode == 200) {

      return ModelMyWithdrawl.fromJson(jsonDecode(response.body));
    } else {

      return ModelMyWithdrawl(
          message: jsonDecode(response.body)["message"],
          status: false,
          data: null);
    }
  } catch (e) {
    return ModelMyWithdrawl(message: e.toString(), data: null,status: false);
  }
}
