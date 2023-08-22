import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/curent_betting_model.dart';
import '../models/get_current_betting.dart';
import '../repository/curent_betting_repo.dart';
import '../repository/get_current_betting_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';
class BettingSetting extends StatefulWidget {
  const BettingSetting({Key? key}) : super(key: key);

  @override
  State<BettingSetting> createState() => _BettingSettingState();
}

class _BettingSettingState extends State<BettingSetting> {
  Rx<RxStatus> statusOfListCurrentBetting = RxStatus.empty().obs;
  Rx<GetCurrentBattingModel> getCurrentBetting = GetCurrentBattingModel().obs;

  getList() {
    getBettingRepo().then((value) {
      getCurrentBetting.value = value;
      if (value.status == true) {
        statusOfListCurrentBetting.value = RxStatus.success();
      } else {
        statusOfListCurrentBetting.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }

  Rx<RxStatus> statusOfCurrentBetting = RxStatus.empty().obs;
  Rx<CurrentBattingModel> CurrentBetting = CurrentBattingModel().obs;

  userBet() {
    currentBetRepo(
      id:  getCurrentBetting.value.data!.id.toString(),
      result: selectedValue,

      context: context,
    ).then((value) {
      print(value.status.toString());
      CurrentBetting.value = value;
      if (value.status == true) {

        // Get.offNamed(MyRouters.thankyouPage);

        statusOfCurrentBetting.value =
            RxStatus.success();
        showToast(value.message.toString());
      } else {
        statusOfCurrentBetting.value =
            RxStatus.error();
        showToast(value.message.toString());
      }

    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
  }
  String selectedValue = "R";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
       DropdownMenuItem(value: "R", child: InkWell(
          onTap: (){
            userBet();
          },

          child: Text("R"))),
       DropdownMenuItem(value: "T", child: InkWell(
           onTap: (){
             userBet();
           },
           child: Text("T"))),
       DropdownMenuItem(value: "B", child: InkWell(
           onTap: (){       userBet();},
           child: Text("B"))),
    ];
    return menuItems;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xFF4e0c0d),
    body: SingleChildScrollView(
    child:
      Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 30),

        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 35,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back,color: Colors.white,)),
            SizedBox(width: 70,),
            Center(
              child: Text("Betting  Setting",  style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,

                  fontWeight: FontWeight.w800 ),textAlign: TextAlign.center,),
            ),
          ],
        ),
        const SizedBox(height: 30,),
    Obx(() {
    return statusOfListCurrentBetting.value.isSuccess
    ?

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Winner Id ',  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,

                    fontWeight: FontWeight.w700 ),),
                SizedBox(height: 10,),
                Text(getCurrentBetting.value.data!.id.toString(),  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,

                    fontWeight: FontWeight.w500 ),)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Winner ',  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,

                    fontWeight: FontWeight.w700 ),),
                SizedBox(height: 10,),
                Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: DropdownButtonHideUnderline(
                    child:
                    DropdownButtonFormField(

                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'Please select your sex'),

                      ]),
                      style:  TextStyle(color: Colors.black,
                          fontSize: 18,fontWeight: FontWeight.w500
                      ),
                      decoration: InputDecoration(

                        contentPadding:
                        EdgeInsets.all(10),
                        border:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                          borderSide: BorderSide(
                              color: Colors.transparent),
                        ),
                        enabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                          borderSide: BorderSide(
                              color: Colors.transparent),
                        ),
                        disabledBorder:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                          borderSide: BorderSide(
                              color: Colors.transparent),
                        ),
                        focusedBorder:
                        OutlineInputBorder(
                          borderRadius:
                          BorderRadius
                              .circular(
                            20,
                          ),
                          borderSide: BorderSide(
                              color: Colors.transparent),
                        ),
                      ),
                      icon: const Icon(Icons
                          .keyboard_arrow_down),
                      isExpanded: true,
                      value: selectedValue,
                      items: dropdownItems,
                      onChanged: (Object? value) {
                        setState(() {
                          selectedValue =
                              value.toString();
                        });
                      },
                    ),
                  ),
                ),

              ],
            ),
          ],
        ) : statusOfListCurrentBetting.value.isError
        ? CommonErrorWidget(
      errorText:
      getCurrentBetting.value.message.toString(),
      onTap: () {},
    )
        : const CommonProgressIndicator();
    }),




      ])  )

    ));
  }
}
