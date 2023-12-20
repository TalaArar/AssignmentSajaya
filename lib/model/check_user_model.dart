import 'dart:convert';

class CheckuserModel {
  String? clientId;
  String? clientSecret;
  String? resultMsg;

  CheckuserModel({
    this.clientId,
    this.clientSecret,
    this.resultMsg,
  });

  factory CheckuserModel.fromRawJson(String str) => CheckuserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckuserModel.fromJson(Map<String, dynamic> json) => CheckuserModel(
    clientId: json["client_ID"],
    clientSecret: json["client_Secret"],
    resultMsg: json["resultMsg"],
  );

  Map<String, dynamic> toJson() => {
    "client_ID": clientId,
    "client_Secret": clientSecret,
    "resultMsg": resultMsg,
  };
}
