import 'package:flutter/material.dart';
import 'package:game/resourses/api_constant.dart';
import 'package:game/routers/my_routers.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/model_my_transistion.dart';
import '../models/my_withdrwl_model.dart';
import '../repository/my_transistion_repo.dart';
import '../repository/my_withdrawl_repo.dart';
import '../resources.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';
import 'Withdraw_popup.dart';

class WithdrawlPage extends StatefulWidget {
  const WithdrawlPage({Key? key}) : super(key: key);

  @override
  State<WithdrawlPage> createState() => _WithdrawlPageState();
}

class _WithdrawlPageState extends State<WithdrawlPage> {
  Rx<RxStatus> statusOfListWithdraw = RxStatus.empty().obs;
  Rx<ModelMyWithdrawl> WithDrwalList = ModelMyWithdrawl().obs;

  getList() {
    getWithdrawRepo().then((value) {
      WithDrwalList.value = value;
      if (value.status == true) {
        statusOfListWithdraw.value = RxStatus.success();
      } else {
        statusOfListWithdraw.value = RxStatus.error();
      }
    }
      // showToast(value.message.toString());
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
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
                        return statusOfListWithdraw.value.isSuccess
                            ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: WithDrwalList.value.data!.length,
                            itemBuilder: (context, index) {
                              return Column(children: <Widget>[

                                InkWell(
                              onTap: (){
                                Get.toNamed(MyRouters.withDrawPopup,arguments: [   WithDrwalList
                                    .value.data![index].id
                                    .toString(),]);
                              },
                                  child: Container(
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
                                                WithDrwalList
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
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("UPI Id",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.w500)),
                                            Text(
                                                WithDrwalList
                                                    .value.data![index].withdrawalUpiId
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
                                                WithDrwalList
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
                                                WithDrwalList
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
                                            Text("WithDraw Date",
                                                style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                    FontWeight.w500)),
                                            Text(
                                                WithDrwalList
                                                    .value.data![index].withdrawalDate
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
                                ),
                                SizedBox(height: 20,),
                              ]);
                            })
                            : statusOfListWithdraw.value.isError
                            ? CommonErrorWidget(
                          errorText:
                          WithDrwalList.value.message.toString(),
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
