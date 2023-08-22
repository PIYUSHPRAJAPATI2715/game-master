import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/login_model.dart';

import '../resourses/api_constant.dart';
import '../resourses/helper.dart';



Future<ModelCommonResponse> loginUserRepo({email,password,context}) async {
  OverlayEntry loader = Helpers.overlayLoader(context);
  Overlay.of(context)!.insert(loader);
  var map = <String, dynamic>{};
  map['email'] = email;
  map['password'] = password;


  print(map);
  // try {
    http.Response response = await http.post(Uri.parse(ApiUrls.login),
        headers:{HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json'},body: jsonEncode(map));
    log("Sign IN DATA${response.body}");
    // http.Response response = await http.post(Uri.parse(ApiUrls.loginUser),
    //     headers: await getAuthHeader(),body: jsonEncode(map) );

    if (response.statusCode == 200) {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelCommonResponse.fromJson(jsonDecode(response.body));

    } else {
      Helpers.hideLoader(loader);
      print(jsonDecode(response.body));
      return ModelCommonResponse(message: jsonDecode(response.body)["message"], status: false);
    }
  // }  catch (e) {
  //   Helpers.hideLoader(loader);
  //   return ModelCommonResponse(message: e.toString(), success: false);
   }
