import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:pokedex_app/src/services/firebase_auth_service.dart";

part "forgot_password_event.dart";
part "forgot_password_state.dart";

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    on<ForgotPasswordEvent>((event, emit) {});

    on<ForgotPasswordSubmit>(sendForgotPassword);
  }

  Future<void> sendForgotPassword(event, emit) async {
    emit(const ForgotPasswordLoadingState(isLoading: true));

    try {
      await _authService.forgotPasswordEmail(
        email: event.email,
      );

      const ForgotPasswordSucessState(code: "123456");
    } catch (e) {
      emit(ForgotPasswordFailureState(errorMessage: e.toString()));
    } finally {
      emit(const ForgotPasswordLoadingState(isLoading: false));
    }
  }
}
