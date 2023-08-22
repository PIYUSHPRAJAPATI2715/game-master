import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model_my_transistion.dart';
import '../repository/my_transistion_repo.dart';
import '../resources.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';

class TransistonPage extends StatefulWidget {
  const TransistonPage({Key? key}) : super(key: key);

  @override
  State<TransistonPage> createState() => _TransistonPageState();
}

class _TransistonPageState extends State<TransistonPage> {
  Rx<RxStatus> statusOfList = RxStatus.empty().obs;
  Rx<ModelMyTransistion> transList = ModelMyTransistion().obs;

  getTransList() {
    getTransRepo().then((value) {
      transList.value = value;
      if (value.status == true) {
        statusOfList.value = RxStatus.success();
      } else {
        statusOfList.value = RxStatus.error();
      }
    }
        // showToast(value.message.toString());
        );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTransList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF4e0c0d),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
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
                              "Transaction",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      Obx(() {
                        return statusOfList.value.isSuccess
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: transList.value.data!.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[

                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 1,
                                                offset: Offset(1, 1))
                                          ]),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Title",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text(
                                                  transList
                                                      .value.data![index].title
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Trans Id",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                              Text(
                                                  transList
                                                      .value.data![index].transId
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Status",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                              Text(
                                                  transList
                                                      .value.data![index].status
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Amount",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                              Text(
                                                  transList
                                                      .value.data![index].amount
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Trans Date",
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                              Text(
                                                  transList
                                                      .value.data![index].transDate
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight:
                                                      FontWeight.w500)),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                  ]);
                                })
                            : statusOfList.value.isError
                                ? CommonErrorWidget(
                                    errorText:
                                        transList.value.message.toString(),
                                    onTap: () {},
                                  )
                                : const CommonProgressIndicator();
                      }),
                      SizedBox(
                        height: 60,
                      ),
                      // Center(
                      // child: Container(
                      // height: 40,
                      // width: 220,
                      // decoration: BoxDecoration(
                      // color: Colors.white,
                      // borderRadius: BorderRadius.circular(10)
                      // ),
                      // child: Center(child: Text('Save',  style: GoogleFonts.poppins(
                      // color: Colors.black,
                      // fontSize: 20,
                      //
                      // fontWeight: FontWeight.w600 ),)),
                      // ),
                      // )
                    ]))));
  }
}
