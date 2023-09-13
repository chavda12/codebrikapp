import 'package:codebrikapp/const/gloabls.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  appDB = await Hive.openBox('appDB');
}
