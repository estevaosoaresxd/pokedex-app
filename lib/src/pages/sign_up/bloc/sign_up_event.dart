part of "sign_up_bloc.dart";

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpUserEmail extends SignUpEvent {
  final String email;
  final String password;

  const SignUpUserEmail(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignUpNextStep extends SignUpEvent {
  final int step;

  const SignUpNextStep(this.step);

  @override
  List<Object> get props => [step];
}
