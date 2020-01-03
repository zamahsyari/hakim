import 'dart:convert';

import 'package:http/http.dart' show Client;
// import 'package:sweetshirt/models/loginRes.dart';
// import 'package:sweetshirt/models/loginReq.dart';
import 'package:probation/model/loginMdl.dart';

class ApiSvc {
  String basicAuth =
      'Bearer bGL0tlrLh1qoznSvQPdu3Qxx15LexoKI17Yl0AB7hxANfTKrgYyNkknvr7pZ';
  final String baseUrl = "http://192.168.1.6";
  Client client = Client();

  Future<LoginRes> login(LoginReq data) async {
    data.appName = "website-hr";
    final response = await client
        .post("$baseUrl/api/login",
            headers: <String, String>{
              "authorization": basicAuth,
              "Content-type": "application/json"
            },
            body: jsonEncode(data.toJson()))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      var loginres = LoginRes.fromJson(json.decode(response.body));
      return loginres;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
