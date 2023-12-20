import 'dart:convert';

class ClientInfoModel {
  int? clientId;
  String? authKey;
  String? clientNameA;
  String? clientNameE;
  String? connection;

  ClientInfoModel({
    this.clientId,
    this.authKey,
    this.clientNameA,
    this.clientNameE,
    this.connection,
  });

  factory ClientInfoModel.fromRawJson(String str) => ClientInfoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClientInfoModel.fromJson(Map<String, dynamic> json) => ClientInfoModel(
    clientId: json["clientID"],
    authKey: json["authKey"],
    clientNameA: json["clientNameA"],
    clientNameE: json["clientNameE"],
    connection: json["connection"],
  );

  Map<String, dynamic> toJson() => {
    "clientID": clientId,
    "authKey": authKey,
    "clientNameA": clientNameA,
    "clientNameE": clientNameE,
    "connection": connection,
  };
}
