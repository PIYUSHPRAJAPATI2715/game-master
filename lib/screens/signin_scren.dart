import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:game/routers/my_routers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/login_repository.dart';
import '../resourses/api_constant.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<RxStatus> statusOfLogin = RxStatus.empty().obs;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
        body: Form(
          key: formKey,
          child: Container(
          width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: const BoxDecoration(
    image: DecorationImage(
    fit: BoxFit.fill,

    image: AssetImage('assets/images/background.jpg',)
    )
    ),
    child: SingleChildScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
    child:Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Center(
              child: Text('WELCOME TO GOLDEN CARDS',  style: GoogleFonts.poppins(
                  color:  const Color(0xFFb99b49),
                  fontSize: 25,

                  fontWeight: FontWeight.w800 ),),
            ),
            SizedBox(height: 10,),
            Center(
              child: Image.network('https://www.pngall.com/wp-content/uploads/4/Playing-Card-PN'
                  'G-High-Quality-Image.png',height: 200,),
            ),
            const SizedBox(height: 50,),
            Center(
              child: Text('LOGIN YOUR ACCOUNT',  style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,

                  fontWeight: FontWeight.w800 ),),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Email',  style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,

                  fontWeight: FontWeight.w500 ),),
            ),
const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,
                          width:1)
                  ),
                  child:  TextFormField (

                    controller: emailController,

                    validator: MultiValidator([
                    RequiredValidator(
                        errorText:
                        'Please enter your email '),
                  ]),

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Email',
                      hintStyle:   TextStyle(color: Colors.black,
                          fontSize: 18,fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                )

            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Password',  style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,

                  fontWeight: FontWeight.w500 ),),
            ),
            const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white,
                          width:1)
                  ),
                  child:  TextFormField (
                    controller: passwordController,
                    validator: MultiValidator([
                      RequiredValidator(
                          errorText:
                          'Please enter your Password'),
                    ]),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Password',

                      hintStyle:   TextStyle(color: Colors.black,
                          fontSize: 18,fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                )

            ),
SizedBox(height: 20,),
Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Text('If you don\'t have an account? ',  style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 15,

          fontWeight: FontWeight.w500 ),),
    InkWell(
      onTap: (){
          Get.toNamed(MyRouters.signupPage);
      },
      child: Text('Signup ',  style: GoogleFonts.poppins(
            color:  const Color(0xFFb99b49),
            fontSize: 15,

            fontWeight: FontWeight.w600 ,decoration: TextDecoration.underline,decorationColor:  Color(0xFFb99b49),decorationThickness: 2),),
    ),
  ],
),
const SizedBox(height: 50,),
            Center(
              child: InkWell(
                onTap: (){
                  if (formKey.currentState!
                      .validate()) {
                    loginUserRepo(
                        email:
                        emailController
                            .text
                            .trim(),
                        password: passwordController.text
                            .trim(),
                        context: context)
                        .then((value) async {
    if (value.status == true) {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('cookie', value.authToken.toString());
    Get.offAllNamed(MyRouters.firstPage);
    statusOfLogin.value = RxStatus.success();
    showToast(value.message.toString());
    } else {
    statusOfLogin.value = RxStatus.error();
    showToast(value.message.toString());
    }
    });
                  }




                },
                child: Container(
                  height: 40,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text('LOGIN',  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,

                      fontWeight: FontWeight.w600 ),)),
                ),
              ),
            )
          ],
      ),
    )
    )),
        )
    );
  }
}
