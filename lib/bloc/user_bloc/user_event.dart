// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:codebrikapp/const/enums.dart';

class UserEvent {}

class GetUserData extends UserEvent {}

class SubmitUserData extends UserEvent {}

class UpdateUserDetailsData extends UserEvent {
  final UserDetailsKeys key;
  final String data;
  UpdateUserDetailsData({
    required this.key,
    required this.data,
  });
}

class UpdateHLTradingData extends UserEvent {
  final Map<String, String> data;
  final bool isAdd;
  UpdateHLTradingData({
    required this.data,
    required this.isAdd,
  });
}

class UpdateExchangeDtData extends UserEvent {
  final Map<String, String> data;
  final bool isAdd;
  UpdateExchangeDtData({
    required this.data,
    required this.isAdd,
  });
}
