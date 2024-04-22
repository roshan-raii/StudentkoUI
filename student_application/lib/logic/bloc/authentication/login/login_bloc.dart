import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:student_application/data/repo/authentication/authentication_repo.dart';
import 'package:student_application/logic/bloc/authentication/login/login_event.dart';
import 'package:student_application/logic/bloc/authentication/login/login_state.dart';

class LoginBloc extends HydratedBloc<LoginEvent, LoginState> {
  LoginBloc({required AuthenticationRepo apiRepository})
      : super(LoginInitial()) {
    on<ClearLoginDetail>((event, emit) => LoginInitial());
    on<LoginClickedEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final login = await apiRepository.loginUser(
            email: event.email, password: event.password);

        print(login);
        if (login.success != 1) {
          emit(LoginError(message: login.message));
          return;
        }
        emit(LoginLoaded(
          loginModel: login,
        ));
      } catch (exc) {
        emit(const LoginError(
            message: "Failed to fetch data, is your device online?"));
      }
    });
  }
  @override
  void onChange(Change<LoginState> change) {
    print(
        "Current State ${change.currentState}, next state ${change.nextState}");
    super.onChange(change);
  }

  @override
  LoginState fromJson(Map<String, dynamic> json) {
    try {
      return LoginLoaded.fromMap(json);
    } catch (e) {
      return LoginInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(LoginState state) {
    if (state is LoginLoaded) {
      return state.toMap();
    }
    return {};
  }
}
