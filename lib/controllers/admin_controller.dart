import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/model_admin_setting.dart';
import '../models/model_get_profile.dart';

import '../repository/get_admin_setting_repo.dart';
import '../repository/get_profile_repo.dart';


class AdminController extends GetxController {
  Rx<RxStatus> statusOfAdmin = RxStatus.empty().obs;

  Rx<ModelAdminSetting> modelAdmin = ModelAdminSetting().obs;
  TextEditingController minDepositeController = TextEditingController();
  TextEditingController minWithdrawController = TextEditingController();
  TextEditingController referBonusController = TextEditingController();



  getAdmin() {
    getAdminSettingRepo().then((value) {
      modelAdmin.value = value;
      if (value.status == true) {

        minDepositeController.text = modelAdmin.value.data!.minDeposit.toString();
        minWithdrawController.text = modelAdmin.value.data!.minWithdrow.toString();
        referBonusController.text = modelAdmin.value.data!.referBonus.toString();
        statusOfAdmin.value = RxStatus.success();
      } else {
        statusOfAdmin .value = RxStatus.error();
      }

      // showToast(value.message.toString());

    }
    );

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAdmin();
  }
}




