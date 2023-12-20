import 'dart:developer';

import 'package:assignment_sajaya/Repository/auth_repoistory.dart';
import 'package:assignment_sajaya/model/client_info_model.dart';
import 'package:get/get.dart';


class AuthController extends GetxController{
  ClientInfoModel clientInfoModel=ClientInfoModel();
  var authkey;
  int? clientid;
  var encrptuser;
  var encrptpass;
  @override
  void onInit() {
    fetclientinfo();
    super.onInit();
  }
  fetclientinfo() async {
    update();
    await AuthRepository().getClientInfo().then((value) {
      clientInfoModel=  value;
      authkey=value.authKey.toString();
      log(authkey);
      clientid=value.clientId;
      update();
    });
  }
}