import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:pokedex_app/src/services/firebase_auth_service.dart";

part "sign_in_auth_event.dart";
part "sign_in_auth_state.dart";

class SignInAuthBloc extends Bloc<SignInAuthEvent, SignInAuthState> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  SignInAuthBloc() : super(SignInAuthInitialState()) {
    on<SignInAuthEvent>((event, emit) {});

    on<SignUpUserEmail>(signUpUserEmail);

    on<SignInUserEmail>(signInUserEmail);

    on<SignInWithGoogle>(signInWithGoogle);

    on<SignInWithApple>(signInWithApple);

    on<SignOut>(signOut);
  }

  Future<void> signUpUserEmail(event, emit) async {
    emit(const SignInAuthLoadingState(isLoading: true));

    try {
      final UserCredential? user =
          await _authService.signUpWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        emit(SignInAuthSucessState(user: user));
      } else {
        emit(const SignInAuthFailureState(errorMessage: "Create user failed"));
      }
    } catch (e) {
      emit(SignInAuthFailureState(errorMessage: e.toString()));
    } finally {
      emit(const SignInAuthLoadingState(isLoading: false));
    }
  }

  Future<void> signInUserEmail(event, emit) async {
    emit(const SignInAuthLoadingState(isLoading: true));

    try {
      final UserCredential? user =
          await _authService.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      if (user != null) {
        emit(SignInAuthSucessState(user: user));
      } else {
        emit(const SignInAuthFailureState(errorMessage: "Sign In Failed"));
      }
    } catch (e) {
      emit(SignInAuthFailureState(errorMessage: e.toString()));
    } finally {
      emit(const SignInAuthLoadingState(isLoading: false));
    }
  }

  Future<void> signInWithGoogle(event, emit) async {
    emit(const SignInAuthLoadingState(isLoading: true));

    try {
      final UserCredential? user = await _authService.signInWithGoogle();

      if (user != null) {
        emit(SignInAuthSucessState(user: user));
      } else {
        emit(const SignInAuthFailureState(errorMessage: "Sign In Failed"));
      }
    } catch (e) {
      emit(SignInAuthFailureState(errorMessage: e.toString()));
    } finally {
      emit(const SignInAuthLoadingState(isLoading: false));
    }
  }

  Future<void> signInWithApple(event, emit) async {
    emit(const SignInAuthLoadingState(isLoading: true));

    try {
      final UserCredential user = await _authService.signInWithApple();

      emit(SignInAuthSucessState(user: user));
    } catch (e) {
      emit(SignInAuthFailureState(errorMessage: e.toString()));
    } finally {
      emit(const SignInAuthLoadingState(isLoading: false));
    }
  }

  Future<void> signOut(event, emit) async {
    emit(const SignInAuthLoadingState(isLoading: true));

    try {
      await _authService.signOutUser();
    } catch (e) {
      emit(SignInAuthFailureState(errorMessage: e.toString()));
    }
    emit(const SignInAuthLoadingState(isLoading: false));
  }
}
