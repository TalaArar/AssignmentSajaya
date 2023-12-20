import 'dart:developer';

import 'package:assignment_sajaya/Repository/auth_repoistory.dart';
import 'package:assignment_sajaya/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
TextEditingController username=TextEditingController();
TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) =>Column(

              children: [
                SizedBox(height: 60,),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(controller.clientInfoModel.clientNameA ??"",style: TextStyle(fontSize: 25),),
              ),
            ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  textAlign: TextAlign.end,
                  controller: username,
                  cursorColor: Colors.grey.shade500,
                  decoration:
                  InputDecoration(
                      hintText: "User Id",

                      hintTextDirection: TextDirection.ltr,

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,

                        ),

                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,

                          ),

                          borderRadius: BorderRadius.circular(10)

                      ),

                  ),
                  onEditingComplete: ()async{

                    final crypto = ClsCrypto(controller.authkey);
                    final encrypted = crypto.encrypt("${username.text}");
                    print("Encrypted: $encrypted");
                       controller.encrptuser=encrypted;
                              },

                  // onTap: (){
                  //   final crypto = ClsCrypto(controller.authkey);
                  //   final encrypted = crypto.encrypt("${username.text}");
                  //   print("Encrypted: $encrypted");
                  //   controller.encrptuser=encrypted;
                  // },

                ),
              ),
                    Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              textAlign: TextAlign.end,
              controller: password,
              cursorColor: Colors.grey.shade500,
              decoration:
              InputDecoration(
                hintText: "password",

                hintTextDirection: TextDirection.ltr,

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,

                  ),

                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,

                    ),

                    borderRadius: BorderRadius.circular(10)

                ),
              ),
              onEditingComplete: (){
                final crypto = ClsCrypto(controller.authkey);
                final encrypted = crypto.encrypt("${password.text}");
                print("Encrypted: $encrypted");
                controller.encrptpass=encrypted;
              },
              onTap: (){
                final crypto = ClsCrypto(controller.authkey);
                final encrypted = crypto.encrypt("${password.text}");
                print("Encrypted: $encrypted");
                controller.encrptpass=encrypted;
              },
            )),

            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,15,8.0,15),
              child: ElevatedButton
                (
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade200,
                      shape:
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),

                      fixedSize: Size(200, 50)
                  ),
                  onPressed: (){
                    final crypto = ClsCrypto(controller.authkey);
                    final encrypted = crypto.encrypt("CCCC-1111-CCCC-2222-CCCC-3333-CCCC");
                    print(encrypted);

                    AuthRepository().checkuser(controller.encrptuser, controller.encrptpass, encrypted, controller.clientid).then((value) {
                    if(value.resultMsg!=null){

                      Fluttertoast.showToast(
                          msg: value.resultMsg.toString(),
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                    });
                  },
                  child: Text("انشاء حساب",
                    style: TextStyle(color: Colors.black,
                        fontSize: 18),)),
            )
              ],),
          ),
        ),
      ),
    );
  }
}
