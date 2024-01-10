part of "forgot_password_bloc.dart";

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitialState extends ForgotPasswordState {}

class ForgotPasswordCodeState extends ForgotPasswordState {
  final bool isCode;

  const ForgotPasswordCodeState({required this.isCode});
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
