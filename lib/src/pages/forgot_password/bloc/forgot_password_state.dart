part of "forgot_password_bloc.dart";

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {
  final bool isLoading;

  const ForgotPasswordLoadingState({required this.isLoading});
}

class ForgotPasswordSucessState extends ForgotPasswordState {
  final String code;

  const ForgotPasswordSucessState({required this.code});

  @override
  List<Object> get props => [code];
}

class ForgotPasswordFailureState extends ForgotPasswordState {
  final String errorMessage;

  const ForgotPasswordFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
