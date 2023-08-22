import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/profile_controler.dart';
import '../models/model_update_profile.dart';
import '../repository/upate_profile_epo.dart';
import '../resourses/api_constant.dart';
import '../routers/my_routers.dart';
import '../widgets/circular_progressindicator.dart';
import '../widgets/common_error_widget.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.put(ProfileController());
  Rx<RxStatus> statusOfUpdate = RxStatus.empty().obs;
  Rx<ModelProfileUpdate> modelUpdateProfile = ModelProfileUpdate().obs;

  updateProfile() {
    updateProfileRepo(
  name:  profileController.profileNameController.text.trim(),
  old_password:profileController.oldPassController.text.trim(),
  password:profileController.newPassController.text.trim(),
  password_confirmation: profileController.confermPassController.text.trim(),

  context: context,
  ).then((value) {
  print(value.status.toString());
  modelUpdateProfile.value = value;
  if (value.status == true) {
    profileController.getDataProfile();
    // Get.offNamed(MyRouters.thankyouPage);

    statusOfUpdate.value =
  RxStatus.success();
  } else {
    statusOfUpdate.value =
  RxStatus.error();
  }
  showToast(value.message.toString());
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // profileController.getDataProfile();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF4e0c0d),
      body:  Obx(() {
      return profileController.statusOfProfile.value.isSuccess
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
                    SizedBox(width: 100,),
                    Center(
                      child: Text("Profile",  style: GoogleFonts.poppins(
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
                      controller: profileController.profileNameController,
                      //readOnly: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Piyush Prajapati',
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
                      controller: profileController.profileemailController,
                      readOnly: true,
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
                child: Text('Old Password',  style: GoogleFonts.poppins(
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
                    child: TextFormField (
                      controller: profileController.oldPassController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Enter Your old Password',
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
                child: Text('New Password',  style: GoogleFonts.poppins(
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
                    child: TextFormField (
                      controller: profileController.newPassController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Enter Your New Password',
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
                child: Text('Comfirm Password',  style: GoogleFonts.poppins(
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
                    child: TextFormField (
                      controller: profileController.confermPassController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: 'Enter Your Conferm Password',
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
                    updateProfile();
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
            ],
          ),
        ),
        )   : profileController.statusOfProfile.value.isError
            ? CommonErrorWidget(
          errorText:
          profileController.modelprofile.value.message.toString(),
          onTap: () {

          },
        )
            : const CommonProgressIndicator();
        }),
    );
  }
}
