part of "sign_up_bloc.dart";

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitialState extends SignUpState {
  final int step;

  const SignUpInitialState({required this.step});

  @override
  List<Object> get props => [step];
}

final class SignUpLoadingState extends SignUpState {
  final bool isLoading;

  const SignUpLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

final class SignUpSucessState extends SignUpState {
  final UserCredential user;

  const SignUpSucessState({required this.user});

  @override
  List<Object> get props => [user];
}

final class SignUpFailureState extends SignUpState {
  final String errorMessage;

  const SignUpFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
