part of "sign_in_auth_bloc.dart";

sealed class SignInAuthEvent extends Equatable {
  const SignInAuthEvent();

  @override
  List<Object> get props => [];
}

class SignInUserEmail extends SignInAuthEvent {
  final String email;
  final String password;

  const SignInUserEmail(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignInWithGoogle extends SignInAuthEvent {}

class SignInWithApple extends SignInAuthEvent {}

class SignOut extends SignInAuthEvent {}
