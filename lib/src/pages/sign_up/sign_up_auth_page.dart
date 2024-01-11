import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/pages/sign_up/bloc/sign_up_bloc.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_default.dart";

class SignUpAuthPage extends StatelessWidget {
  const SignUpAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = SignUpBloc();

    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    String stepTitleTop(int step) {
      switch (step) {
        case 0:
          return "Vamos começar!";
        case 1:
          return "Agora...";
        case 2:
          return "Pra finalizar";
        default:
          return "Vamos começar!";
      }
    }

    String stepTitleBottom(int step) {
      switch (step) {
        case 0:
          return "Qual é o seu e-mail?";
        case 1:
          return "Crie uma senha";
        case 2:
          return "Qual é o seu nome?";
        default:
          return "Qual é o seu e-mail?";
      }
    }

    String stepLabelBottom(int step) {
      switch (step) {
        case 0:
          return "Use um endereço de e-mail válido.";
        case 1:
          return "Sua senha deve ter pelo menos 8 caracteres";
        case 2:
          return "Esse será seu nome de usuário no aplicativo.";
        default:
          return "Use um endereço de e-mail válido.";
      }
    }

    String stepTitleButton(int step) {
      return step == 2 ? "Criar conta" : "Continuar";
    }

    Widget stepFormField(int step) {
      switch (step) {
        case 0:
          return TextFormFieldDefault(
            hintText: "E-mail",
            controller: emailController,
            textInputType: TextInputType.emailAddress,
          );
        case 1:
          return TextFormFieldDefault(
            hintText: "Senha",
            controller: passwordController,
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          );
        case 2:
          return TextFormFieldDefault(
            hintText: "Nome",
            controller: nameController,
            textInputType: TextInputType.name,
          );
        default:
          return Container();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 16,
          ),
          child: BlocConsumer<SignUpBloc, SignUpState>(
            bloc: bloc,
            listener: (context, state) {
              if (state is SignUpSucessState) {
                context.goNamed("sign-in-sucess");
              } else if (state is SignUpFailureState) {
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
            builder: (context, state) {
              return Column(
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
                              "Criar conta",
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
                        if (state is SignUpInitialState) ...[
                          Column(
                            children: [
                              Text(
                                stepTitleTop(state.step),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: Colors.grey[700]),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                stepTitleBottom(state.step),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          stepFormField(state.step),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            stepLabelBottom(state.step),
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]
                      ],
                    ),
                  ),
                  if (state is SignUpInitialState)
                    CircularButtonDefault(
                      title: stepTitleButton(state.step),
                      backgroundColor: context.colorScheme.primary,
                      style: context.textTheme.bodyMedium,
                      onPressed: () => bloc.add(
                        state.step < 2
                            ? SignUpNextStep(state.step + 1)
                            : SignUpUserEmail(
                                emailController.text,
                                passwordController.text,
                              ),
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
