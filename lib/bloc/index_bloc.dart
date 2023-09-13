import 'package:codebrikapp/bloc/app_bloc/app_bloc.dart';
import 'package:codebrikapp/bloc/app_bloc/app_state.dart';
import 'package:codebrikapp/bloc/user_bloc/user_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_event.dart';
import 'package:codebrikapp/bloc/user_bloc/user_state.dart';
import 'package:codebrikapp/const/enums.dart';
import 'package:codebrikapp/const/gloabls.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

AppBloc get appBloc => gContext.read<AppBloc>();
AppState get appState => appBloc.state;

UserBloc get userBloc => gContext.read<UserBloc>();
UserState get userState => userBloc.state;

final updateUserDetails = (UserDetailsKeys key, String data) =>
    userBloc.add(UpdateUserDetailsData(key: key, data: data));
