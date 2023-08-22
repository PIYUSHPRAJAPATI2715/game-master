import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model_user_bet.dart';
import '../models/model_withdrawl_update.dart';
import '../repository/user_bet_repo.dart';
import '../repository/withdrawl_update.dart';
import '../resources.dart';
import '../resourses/api_constant.dart';
class WithDrawPopup extends StatefulWidget {
  const WithDrawPopup({Key? key}) : super(key: key);

  @override
  State<WithDrawPopup> createState() => _WithDrawPopupState();
}

class _WithDrawPopupState extends State<WithDrawPopup> {
  String selectedValue = "success";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "success", child: Text("success")),
      const DropdownMenuItem(value: "pending", child: Text("pending")),
      const DropdownMenuItem(value: "cancel", child: Text("cancel")),
    ];
    return menuItems;
  }
  var initStateBlank = Get.arguments[0];

  Rx<RxStatus> statusOfUpdate = RxStatus.empty().obs;
  TextEditingController amountController = TextEditingController();
  Rx<ModelWithdrawlUpdte> updateWithdrawl = ModelWithdrawlUpdte().obs;

  userUpdate() {
    updatwWithdrawlRepo(
   status: selectedValue.toString(),
      id: initStateBlank.toString(),

      context: context,
    ).then((value) {
      print(value.status.toString());
      updateWithdrawl.value = value;
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
                            "WithDrawal",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w800),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
    SizedBox(height: 30,),
                    Container(
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
                    SizedBox(height: 60,),
                    InkWell(
                      onTap: (){
                        userUpdate();
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

