import 'package:codebrikapp/config/http/endpoints.dart';
import 'package:codebrikapp/config/http/http_enum.dart';
import 'package:codebrikapp/const/gloabls.dart';
import 'package:codebrikapp/utils/functions.dart';

class AppRepo {
  AppRepo._();

  static Future<dynamic> getToken() async {
    try {
      final res = await apiClinet.post(
        Endpoints.token,
        {
          "grant_type": "password",
          "username": "demo",
          "password": 123123,
        },
        base: BaseUrl.devBazaar,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
      );

      if (res.hasData) {
        final token = res.data['access_token'];
        setToken = token;
        final rToken = res.data['refresh_token'];
        setRefreshToken = rToken;
      }
    } catch (e) {}
  }

  static Future<dynamic> refreshToken() async {
    try {
      try {
        final res = await apiClinet.post(
          Endpoints.token,
          {
            "grant_type": "refresh_token",
            "refresh_token": getToken,
          },
          base: BaseUrl.devBazaar,
          headers: {"Content-Type": "application/x-www-form-urlencoded"},
        );

        if (res.hasData) {
          final token = res.data['access_token'];
          // setToken = token;
        }
      } catch (e) {}
    } catch (e) {}
  }
}
