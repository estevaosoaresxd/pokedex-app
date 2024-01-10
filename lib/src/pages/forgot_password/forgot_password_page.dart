import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/pages/forgot_password/bloc/forgot_password_bloc.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_pin.dart";

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final emailController = TextEditingController();
    final bloc = ForgotPasswordBloc();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          child: BlocConsumer(
            bloc: bloc,
            listener: (context, state) {
              if (state is ForgotPasswordSucessState) {
                context.goNamed("sign-in-sucess");
              } else if (state is ForgotPasswordFailureState) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(state.errorMessage),
                    );
                  },
                );
              }
            },
            builder: (_, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            onPressed: () => context.pop(),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Esqueci minha senha",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Column(
                        children: [
                          if (state is ForgotPasswordInitialState) ...[
                            Text(
                              "Vamos recuperar!",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.grey[700]),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                          Text(
                            state is ForgotPasswordCodeState
                                ? "Insira o código"
                                : "Qual é o seu e-mail?",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          if (state is ForgotPasswordCodeState) ...[
                            const SizedBox(height: 4),
                            Text.rich(
                              TextSpan(
                                text:
                                    "Digite o código de 6 dígitos enviado para ",
                                style: context.textTheme.labelMedium,
                                children: [
                                  TextSpan(
                                    text: "meuemail@gmail.com",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            )
                          ]
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      state is ForgotPasswordCodeState
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...List.generate(
                                  6,
                                  (index) => TextFormFieldPin(
                                    autoFocus: index == 0,
                                    controller: TextEditingController(),
                                  ),
                                )
                              ],
                            )
                          : TextFormFieldDefault(
                              hintText: "E-mail",
                              controller: emailController,
                              textInputType: TextInputType.emailAddress,
                            ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        state is ForgotPasswordCodeState
                            ? "Não recebeu o código? "
                            : "Vamos enviar um código de verificação para o seu e-mail.",
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (state is ForgotPasswordCodeState) ...[
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Reenvie em 0:59",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: Colors.grey[700]),
                          textAlign: TextAlign.center,
                        ),
                      ]
                    ],
                  ),
                ),
                CircularButtonDefault(
                  title: "Continuar",
                  backgroundColor: context.colorScheme.primary,
                  style: context.textTheme.bodyMedium,
                  onPressed: () => state is ForgotPasswordCodeState &&
                          state.isCode
                      ? bloc.add(const ForgotPasswordVerifyCode("123456"))
                      : bloc.add(ForgotPasswordSubmit(emailController.text)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
