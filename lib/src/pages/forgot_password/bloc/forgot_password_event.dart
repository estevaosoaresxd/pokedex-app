part of "forgot_password_bloc.dart";

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordSubmit extends ForgotPasswordEvent {
  final String email;

  const ForgotPasswordSubmit(this.email);

  @override
  List<Object> get props => [email];
}

class ForgotPasswordVerifyCode extends ForgotPasswordEvent {
  final String code;

  const ForgotPasswordVerifyCode(this.code);

  @override
  List<Object> get props => [code];
}
