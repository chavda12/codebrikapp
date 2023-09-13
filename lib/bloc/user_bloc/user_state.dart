// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:codebrikapp/model/user_model.dart';

class UserState {
  final UserModel userModel;
  final Map<String, dynamic> dataToUpdate;
  UserState({required this.userModel, this.dataToUpdate = const {}});

  UserState copyWith({
    UserModel? userModel,
    Map<String, dynamic>? dataToUpdate,
  }) {
    return UserState(
      userModel: userModel ?? this.userModel,
      dataToUpdate: dataToUpdate ?? this.dataToUpdate,
    );
  }
}
