import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_event.dart';
import 'package:codebrikapp/bloc/user_bloc/user_state.dart';
import 'package:codebrikapp/const/enums.dart';
import 'package:codebrikapp/const/gloabls.dart';
import 'package:codebrikapp/model/user_model.dart';
import 'package:codebrikapp/repositories/user_repo.dart';
import 'package:flutter/widgets.dart';

typedef BlocEmit = Emitter<UserState>;

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(userModel: UserModel.empty())) {
    on<GetUserData>(_getUserData);
    on<SubmitUserData>(_submitUserData);
    on<UpdateUserDetailsData>(_updateUserDetailsData);
    on<UpdateHLTradingData>(_updateHLTradingData);
    on<UpdateExchangeDtData>(_updateExchangeDtData);
  }

  void _getUserData(GetUserData event, Emitter<UserState> emit) async {
    try {
      final res = await UserRepo.getUserData();
      if (res != null) {
        emit(state.copyWith(userModel: res));
      }
    } catch (e) {}
  }

  void _submitUserData(SubmitUserData event, Emitter<UserState> emit) async {
    try {
      final body = Map<String, dynamic>.from(state.dataToUpdate);
      body['loginUserId'] = '2';
      final res = await UserRepo.submitUserData(body);
    } catch (e) {}
  }

  void _updateUserDetailsData(
      UpdateUserDetailsData event, Emitter<UserState> emit) {
    final newData = Map<String, dynamic>.from(state.dataToUpdate);
    newData[event.key.name] = event.data;
    print(newData);
    emit(state.copyWith(dataToUpdate: newData));
  }

  FutureOr<void> _updateHLTradingData(
      UpdateHLTradingData event, Emitter<UserState> emit) {
    final newHLData = List<Map<String, String>>.from(
        state.dataToUpdate[UserDetailsKeys.dtHighLowTradingBo.name] ?? []);

    if (event.isAdd) {
      newHLData.add(event.data);
    } else {
      newHLData.removeWhere((el) => el['id'] == event.data['id']);
    }

    final newData = Map<String, dynamic>.from(state.dataToUpdate);
    newData[UserDetailsKeys.dtHighLowTradingBo.name] = newHLData;
    emit(state.copyWith(dataToUpdate: newData));
  }

  Future<FutureOr<void>> _updateExchangeDtData(
      UpdateExchangeDtData event, Emitter<UserState> emit) async {
    final newExchangeData = List<Map<String, String>>.from(
        state.dataToUpdate[UserDetailsKeys.dtExchangeDtiBo.name] ?? []);

    if (event.isAdd) {
      newExchangeData.add(event.data);
    } else {
      newExchangeData.removeWhere((el) => el['id'] == event.data['id']);
    }

    final newData = Map<String, dynamic>.from(state.dataToUpdate);
    newData[UserDetailsKeys.dtExchangeDtiBo.name] = newExchangeData;
    emit(state.copyWith(dataToUpdate: newData));
  }
}
