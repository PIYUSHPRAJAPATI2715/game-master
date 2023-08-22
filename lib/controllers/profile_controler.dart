import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/model_get_profile.dart';

import '../repository/get_profile_repo.dart';


class ProfileController extends GetxController {
  Rx<RxStatus> statusOfProfile = RxStatus.empty().obs;

  Rx<ModelGetProfile> modelprofile = ModelGetProfile().obs;
  TextEditingController profileNameController = TextEditingController();
  TextEditingController profilemobilenumberController = TextEditingController();
  TextEditingController profileemailController = TextEditingController();
  TextEditingController profileageController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confermPassController = TextEditingController();


  getDataProfile() {
    getProfileRepo().then((value) {
      modelprofile.value = value;
      if (value.status == true) {

          profileNameController.text = modelprofile.value.data!.name.toString();
          profileemailController.text = modelprofile.value.data!.email.toString();
          statusOfProfile.value = RxStatus.success();
        } else {
          statusOfProfile.value = RxStatus.error();
        }

        // showToast(value.message.toString());

    }
    );

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
 getDataProfile();
  }
}




