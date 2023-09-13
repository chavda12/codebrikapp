import 'package:codebrikapp/bloc/app_bloc/app_event.dart';
import 'package:codebrikapp/bloc/index_bloc.dart';
import 'package:codebrikapp/config/http/endpoints.dart';
import 'package:codebrikapp/config/http/http_enum.dart';
import 'package:codebrikapp/const/gloabls.dart';
import 'package:codebrikapp/model/user_model.dart';
import 'package:codebrikapp/utils/functions.dart';
import 'package:dartx/dartx.dart';

class UserRepo {
  UserRepo._();

  static Future<UserModel?> getUserData() async {
    try {
      final res = await apiClinet.post(Endpoints.getUserData, {},
          base: BaseUrl.devBazaar,
          headers: {
            if (getToken.isNotBlank) "Authorization": "Bearer $getToken",
            "Content-Type": "application/x-www-form-urlencoded"
          });
      if (res.hasData) {
        final data = UserModel.fromMap(res.data);
        appBloc.add(RefreshToken());
        return data;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<dynamic> submitUserData(Map<String, dynamic> body) async {
    try {
      final res = await apiClinet
          .post(Endpoints.updateUser, body, base: BaseUrl.bigbull, headers: {
        if (getToken.isNotBlank) "Authorization": "Bearer $getToken",
        "Content-Type": 'application/x-www-form-urlencoded'
      });
      print(res.data);
      return res.data;
    } catch (e) {}
  }
}
