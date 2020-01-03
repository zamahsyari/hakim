class LoginReq {
  String username;
  String password;
  String appName;

  LoginReq({this.username, this.password, this.appName});

  LoginReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    appName = json['app_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['app_name'] = this.appName;
    return data;
  }
}

class LoginRes {
  bool status;
  String code;
  String message;
  String token;
  ExpiredAt expiredAt;

  LoginRes({this.status, this.code, this.message, this.token, this.expiredAt});

  LoginRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    token = json['token'];
    expiredAt = json['expired_at'] != null
        ? new ExpiredAt.fromJson(json['expired_at'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.expiredAt != null) {
      data['expired_at'] = this.expiredAt.toJson();
    }
    return data;
  }
}

class ExpiredAt {
  String date;
  ExpiredAt({this.date});
  ExpiredAt.fromJson(Map<String, dynamic> json) {
    date = json['date'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    return data;
  }
}
