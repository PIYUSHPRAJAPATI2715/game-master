import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'package:shared_preferences/shared_preferences.dart';

import '../routers/my_routers.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {



  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      // enableCheck = true;
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getString('cookie') != null) {
        Get.offAllNamed(MyRouters.firstPage);
      }

      else {
        Get.offAllNamed(MyRouters.signInPage);
      }
    }
    );
  }




  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return GestureDetector(

      behavior: HitTestBehavior.translucent,
      child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Image.asset((
                "assets/images/splash.png"
            ),
              fit: BoxFit.fill,),
          )),
    );
  }


}
