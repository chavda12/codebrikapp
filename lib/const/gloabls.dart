import 'package:codebrikapp/config/http/api_client.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

final apiClinet = ApiClient.init();

late BuildContext gContext;
Map mapData = {};
late final Box appDB;

const List<Map<String, String>> exchangeList = [
  {"name": "N", "id": "1"},
  {"name": "M", "id": "2"},
  {"name": "S", "id": "3"},
  {"name": "OTHERS", "id": "4"},
  {"name": "CMX", "id": "5"},
  {"name": "NCDX", "id": "6"},
  {"name": "MINI", "id": "7"},
  {"name": "SPOT", "id": "11"},
  {"name": "CP", "id": "12"},
];

const List<Map<String, String>> tradeList = [
  {"id": "1", "name": "N"},
  {"id": "2", "name": "M"},
  {"id": "3", "name": "S"},
  {"id": "5", "name": "CMX"},
  {"id": "6", "name": "NCDX"},
  {"id": "7", "name": "MINI"}
];
