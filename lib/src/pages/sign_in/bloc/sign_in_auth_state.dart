part of "sign_in_auth_bloc.dart";

sealed class SignInAuthState extends Equatable {
  const SignInAuthState();

  @override
  List<Object> get props => [];
}

class SignInAuthInitialState extends SignInAuthState {}

class SignInAuthLoadingState extends SignInAuthState {
  final bool isLoading;

  const SignInAuthLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class SignInAuthSucessState extends SignInAuthState {
  final UserCredential user;

  const SignInAuthSucessState({required this.user});

  @override
  List<Object> get props => [user];
}

class SignInAuthFailureState extends SignInAuthState {
  final String errorMessage;

  const SignInAuthFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
