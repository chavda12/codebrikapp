import 'package:bloc/bloc.dart';
import 'package:codebrikapp/bloc/app_bloc/app_event.dart';
import 'package:codebrikapp/bloc/app_bloc/app_state.dart';
import 'package:codebrikapp/bloc/index_bloc.dart';
import 'package:codebrikapp/bloc/user_bloc/user_event.dart';
import 'package:codebrikapp/repositories/app_repo.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<GenerateToken>(_generateToken);
    on<RefreshToken>(_refreshToken);
  }

  void _generateToken(GenerateToken event, Emitter<AppState> emitter) async {
    try {
      await AppRepo.getToken();
      userBloc.add(GetUserData());
    } catch (e) {}
  }

  void _refreshToken(RefreshToken event, Emitter<AppState> emitter) async {
    await AppRepo.refreshToken();
  }
}
