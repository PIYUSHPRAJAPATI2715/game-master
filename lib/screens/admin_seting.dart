import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/admin_controller.dart';
import '../controllers/profile_controler.dart';
import '../models/model_admin_setting.dart';
import '../repository/admin_setting_repo.dart';
import '../resourses/api_constant.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';
class AdminSetting extends StatefulWidget {
  const AdminSetting({Key? key}) : super(key: key);

  @override
  State<AdminSetting> createState() => _AdminSettingState();
}

class _AdminSettingState extends State<AdminSetting> {
  final adminController = Get.put(AdminController());

  Rx<RxStatus> statusOfUpdateAdmin = RxStatus.empty().obs;
  Rx<ModelAdminSetting> modelUpdateAdmin = ModelAdminSetting().obs;

  updateAdmin() {
    adminSettingRepo(
     min_deposit: adminController.minDepositeController.text.trim(),
      min_withdrow:  adminController.minWithdrawController.text.trim(),
      refer_bonus:  adminController.referBonusController.text.trim(),


      context: context,
    ).then((value) {
      print(value.status.toString());
      modelUpdateAdmin.value = value;
      if (value.status == true) {

        // Get.offNamed(MyRouters.thankyouPage);

        statusOfUpdateAdmin.value =
            RxStatus.success();  showToast(value.message.toString());

      } else {
        statusOfUpdateAdmin.value =
            RxStatus.error();
        showToast(value.message.toString());
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xFF4e0c0d),
        body: Obx(() {
      return adminController.statusOfAdmin.value.isSuccess
          ?


      SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: (){
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back,color: Colors.white,)),
                            SizedBox(width: 80,),
                            Center(
                              child: Text("Admin Setting",  style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 25,

                                  fontWeight: FontWeight.w800 ),textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Minimum Diposite amount',  style: GoogleFonts.poppins(
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
                              controller: adminController.minDepositeController,
                              //readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: 'Enter minimum Amount',
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
                        child: Text('Withdrawl Amounts',  style: GoogleFonts.poppins(
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
                              controller: adminController.minWithdrawController,
                              readOnly: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: '10000',
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
                        child: Text('Refer Bonus',  style: GoogleFonts.poppins(
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
                              controller: adminController.referBonusController,
                              readOnly: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 10),
                                hintText: '10000',
                                hintStyle:   TextStyle(color: Colors.black,
                                    fontSize: 18,fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          )

                      ),
                      SizedBox(height: 60,),
                      Center(
                        child: InkWell(
                          onTap: (){
                            updateAdmin();
                          },
                          child: Container(
                            height: 40,
                            width: 220,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: Text('Update',  style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,

                                fontWeight: FontWeight.w600 ),)),
                          ),
                        ),
                      )

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
                    ]
                ))) : adminController.statusOfAdmin.value.isError
          ? CommonErrorWidget(
        errorText:
        adminController.modelAdmin.value.message.toString(),
        onTap: () {

        },
      )
          : const CommonProgressIndicator();
        }),);
  }
}
