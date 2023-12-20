import 'dart:convert';
import 'dart:developer';
// }import 'dart:convert';
import 'package:assignment_sajaya/model/check_user_model.dart';
import 'package:encrypt/encrypt.dart';
import 'package:assignment_sajaya/model/client_info_model.dart';
// import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:http/http.dart' as http;

class AuthRepository {
Future<CheckuserModel> checkuser(userid,password,license,clientid)async{
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json'
  };
  var request = http.Request('POST', Uri.parse('http://62.171.187.39:57788/api/Sajaya/CheckUser'));
  request.body = json.encode({
    "UserID": userid,
    "Password": password,
    "LicenseKey": license,
    "ClientID": clientid,
    "IsLogin": false
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
    String res=await response.stream.bytesToString();
  if (response.statusCode == 200) {
   return CheckuserModel.fromJson(json.decode(res));
  }
  else {
  print(response.reasonPhrase);
  return CheckuserModel.fromJson(json.decode(res));

  }

}
  Future<ClientInfoModel> getClientInfo() async {
    final crypto = ClsCrypto("\$@J@Y@_3RP\$Y\$T3M");
    final encrypted = crypto.encrypt("CCCC-1111-CCCC-2222-CCCC-3333-CCCC");
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('http://62.171.187.39:57788/api/Sajaya/GetClientInfo'));
    request.body = json.encode({
      "ProductID": 8,
      "LicenseKey": encrypted
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return ClientInfoModel.fromJson(json.decode(res));
    }
    else {
      print(response.reasonPhrase);
      return ClientInfoModel.fromJson(json.decode(res));
    }
  }

}
class ClsCrypto {
  final IV myIv;
  // final Key myKey;
  final Encrypter encrypter;

  ClsCrypto(String strIV)
      : myIv = IV.fromUtf8(
  strIV.length > 16 ? strIV.substring(0, 16) : strIV.padRight(16, '*')),
  encrypter = Encrypter(AES(Key.fromUtf8("\$@J@Y@3NT3RPRI\$3R3\$OURC3PL@NNING"),mode: AESMode.cbc));

  String encrypt(String strPlainText) {
  final encryptedText = encrypter.encrypt(strPlainText, iv: myIv);
  return encryptedText.base64;
  }

  String decrypt(String encryptedText) {
  final encrypted = Encrypted.fromBase64(encryptedText);
  final decryptedText = encrypter.decrypt(encrypted, iv: myIv);
  return decryptedText;
  }
  }
