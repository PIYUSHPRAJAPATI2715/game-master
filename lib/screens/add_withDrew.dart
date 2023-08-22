import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model_add_withDrewl.dart';
import '../models/model_user_bet.dart';
import '../repository/add_withdraw_repo.dart';
import '../repository/user_bet_repo.dart';
import '../resources.dart';
import '../resourses/api_constant.dart';
class AddWithDraw extends StatefulWidget {
  const AddWithDraw({Key? key}) : super(key: key);

  @override
  State<AddWithDraw> createState() => _AddWithDrawState();
}

class _AddWithDrawState extends State<AddWithDraw> {
  String selectedValue = "success";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "success", child: Text("success")),
      const DropdownMenuItem(value: "pending", child: Text("pending")),
      const DropdownMenuItem(value: "cancel", child: Text("cancel")),
    ];
    return menuItems;
  }
  Rx<RxStatus> statusOfAdd= RxStatus.empty().obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController upiController = TextEditingController();
  Rx<ModelAddWithdrawl> addWithdraw = ModelAddWithdrawl().obs;

  userAdd() {
    addWithdrawlRepo(
      amount: amountController.text.trim(),
      upiId: upiController.text.trim(),

      context: context,
    ).then((value) {
      print(value.status.toString());
      addWithdraw.value = value;
      if (value.status == true) {

        // Get.offNamed(MyRouters.thankyouPage);

        statusOfAdd.value =
            RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfAdd.value =
            RxStatus.error();
        showToast(value.message.toString());
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xFF4e0c0d),
        body: SingleChildScrollView(
            child:
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 30),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 80,
                      ),
                      Center(
                        child: Text(
                          "Add WithDrawal",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('WithDrawal Money ',  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,

                      fontWeight: FontWeight.w600 ),),
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.only(left: 4.0,right: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white,
                                width:1)
                        ),
                        child: TextFormField (
                          controller: amountController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Enter Your amount',
                            hintStyle:   TextStyle(color: Colors.black,
                                fontSize: 18,fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      )

                  ),
                  SizedBox(height: 20,),
                  Text('UPI Id ',  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,

                      fontWeight: FontWeight.w600 ),),
                  SizedBox(height: 10,),
                  Padding(
                      padding: const EdgeInsets.only(left: 4.0,right: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white,
                                width:1)
                        ),
                        child: TextFormField (
                          controller: upiController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Enter Your UPI',
                            hintStyle:   TextStyle(color: Colors.black,
                                fontSize: 18,fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                      )

                  ),

                  SizedBox(height: 60,),
                  InkWell(
                    onTap: (){
                      userAdd();
                    },
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('WithDraw',  style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 20,

                            fontWeight: FontWeight.w600 ),)),
                      ),
                    ),
                  )

                ],
              ),  )

        ));
  }
}

