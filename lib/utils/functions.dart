import 'package:codebrikapp/const/gloabls.dart';

String get getToken => appDB.get('token', defaultValue: "");
set setToken(String token) => appDB.put('token', token);

String get getRefreshToken => appDB.get('rtoken', defaultValue: "");
set setRefreshToken(String value) => appDB.put('rtoken', value);
