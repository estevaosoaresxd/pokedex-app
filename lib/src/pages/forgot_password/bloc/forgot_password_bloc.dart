import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:pokedex_app/src/services/firebase_auth_service.dart";

part "forgot_password_event.dart";
part "forgot_password_state.dart";

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  ForgotPasswordBloc() : super(ForgotPasswordInitialState()) {
    on<ForgotPasswordEvent>((event, emit) {});

    on<ForgotPasswordSubmit>(sendForgotPassword);

    on<ForgotPasswordVerifyCode>(verifyCode);
  }

  Future<void> sendForgotPassword(event, emit) async {
    try {
      await _authService.forgotPasswordEmail(
        email: event.email,
      );
    } catch (e) {
      emit(ForgotPasswordFailureState(errorMessage: e.toString()));
    } finally {
      emit(const ForgotPasswordCodeState(isCode: true));
    }
  }

  Future<void> verifyCode(event, emit) async {
    emit(ForgotPasswordSucessState(code: event.code));
  }
}
