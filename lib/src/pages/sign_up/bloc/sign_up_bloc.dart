import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:pokedex_app/src/services/firebase_auth_service.dart";

part "sign_up_event.dart";
part "sign_up_state.dart";

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  SignUpBloc() : super(const SignUpInitialState(step: 0)) {
    on<SignUpEvent>((event, emit) {});

    on<SignUpUserEmail>(signUpUserEmail);

    on<SignUpNextStep>(nextStep);
  }

  Future<void> signUpUserEmail(event, emit) async {
    emit(const SignUpLoadingState(isLoading: true));

    try {
      final UserCredential? user =
          await _authService.signUpWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        emit(SignUpSucessState(user: user));
      } else {
        emit(const SignUpFailureState(errorMessage: "Create user failed"));
      }
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    } finally {
      emit(const SignUpLoadingState(isLoading: false));
    }
  }

  Future<void> nextStep(event, emit) async {
    emit(SignUpInitialState(step: event.step));
  }
}
