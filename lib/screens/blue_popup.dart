import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model_user_bet.dart';
import '../repository/user_bet_repo.dart';
import '../resourses/api_constant.dart';
class BlueAddMoneyPopup extends StatefulWidget {
  const BlueAddMoneyPopup({Key? key}) : super(key: key);

  @override
  State<BlueAddMoneyPopup> createState() => _BlueAddMoneyPopupState();
}

class _BlueAddMoneyPopupState extends State<BlueAddMoneyPopup> {
  Rx<RxStatus> statusOfUpdate = RxStatus.empty().obs;
  TextEditingController amountController = TextEditingController();
  Rx<ModelUserBet> BET = ModelUserBet().obs;

  userBet() {
    userBetRepo(
      amount: amountController.text.trim(),
      bet_on: "B",

      context: context,
    ).then((value) {
      print(value.status.toString());
      BET.value = value;
      if (value.status == true) {

        // Get.offNamed(MyRouters.thankyouPage);

        statusOfUpdate.value =
            RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfUpdate.value =
            RxStatus.error();
        showToast(value.message.toString());
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        insetPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Container(
            width: 270,
            height: 270,
            decoration:


            BoxDecoration(
              image:  DecorationImage(
                  fit: BoxFit.fill,

                  image: AssetImage('assets/images/background.jpg',)
              ),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:  const Color(0xFFb99b49),width: 10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFb99b49),
                  offset: Offset(0, 0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: RotatedBox(
              quarterTurns: 1,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text('Bet Money',  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 25,

                      fontWeight: FontWeight.w600 ),),
                  SizedBox(height: 40,),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
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
                  SizedBox(height: 60,),
                  InkWell(
                    onTap: (){
                      userBet();
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Sumbit',  style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 20,

                          fontWeight: FontWeight.w600 ),)),
                    ),
                  )

                ],
              ),
            )));
  }
}

