import 'package:bloc/bloc.dart';
import 'package:codebrikapp/bloc/user_event.dart';
import 'package:codebrikapp/bloc/user_state.dart';

typedef BlocEmit = Emitter<UserState>;

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    try {
      on<createUser>((event, emit) => _createUser(emit));
    } catch (e) {}

    _createUser(Emitter<UserState> emit) async {
      emit(state.copyWith());
    }
  }
}
