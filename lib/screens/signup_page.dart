import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:game/routers/my_routers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../repository/signup_repo.dart';
import '../resourses/api_constant.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {



  final formKey1 = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController referController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPaswordController = TextEditingController();

  RegisterApi() {
    if (formKey1.currentState!.validate()) {
      signupUserRepo(
       comfirm_password:confirmPaswordController.text.trim() ,
          password: passwordController.text.trim(),
          name: nameController.text.trim(),

          email: emailController.text.trim(),
refer_code: referController.text.trim(),
          context: context)
          .then((value) {
        print(value.message.toString());
        if (value.status == true) {
          Get.toNamed(MyRouters.signInPage);
          showToast(value.message.toString());
        }
        showToast(value.message.toString());
      });
    }
  }
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
        body: Container(
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
                  child: Form(
                    key: formKey1,
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
                          child: Text('SIGNUP YOUR ACCOUNT',  style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,

                              fontWeight: FontWeight.w800 ),),
                        ),
                        const SizedBox(height: 30,),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Name',  style: GoogleFonts.poppins(
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
                                controller: nameController,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                      'Please enter your name'),
                                ]),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: 'Enter Your Name',
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
                                controller: emailController,   validator: MultiValidator([
                                RequiredValidator(
                                    errorText:
                                    'Please enter your email'),
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
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                      'Please enter your password'),
                                ]),
                                controller: passwordController,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Conform Password',  style: GoogleFonts.poppins(
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
                                controller: confirmPaswordController,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                      'Please enter your Confirm Password '),
                                ]),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: 'Enter Your Conform Password',
                                  hintStyle:   TextStyle(color: Colors.black,
                                      fontSize: 18,fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            )

                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('Refer code',  style: GoogleFonts.poppins(
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
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText:
                                      'Please enter your refer code'),
                                ]),
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(left: 10),
                                  hintText: 'Enter Your refer code',
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
                            Text('If you already have an account? ',  style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,

                                fontWeight: FontWeight.w500 ),),
                            InkWell(
                              onTap: (){
                                Get.toNamed(MyRouters.signInPage);
                              },
                              child: Text('Login ',  style: GoogleFonts.poppins(
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

                              RegisterApi();

                            },
                            child: Container(
                              height: 40,
                              width: 160,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(child: Text('SIGNUP',  style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 20,

                                  fontWeight: FontWeight.w600 ),)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ))
    );
  }
}

