import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/pages/sign_in/bloc/sign_in_auth_bloc.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_default.dart";

class SignInAuthPage extends StatelessWidget {
  const SignInAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final size = context.screenSize;
    final bloc = SignInAuthBloc();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height * 0.95,
            width: size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 16,
            ),
            child: BlocConsumer<SignInAuthBloc, SignInAuthState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is SignInAuthSucessState) {
                  context.goNamed("sign-in-sucess");
                } else if (state is SignInAuthFailureState) {
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
                                "Entrar",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              const IconButton(
                                onPressed: null,
                                icon: Icon(
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
                              Text(
                                "Bem vindo de volta!",
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
                                "Preencha os dados",
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "E-mail",
                                    style: context.textTheme.labelSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormFieldDefault(
                                    hintText: "E-mail",
                                    controller: emailController,
                                    textInputType: TextInputType.emailAddress,
                                  )
                                ],
                              ),
                              const SizedBox(height: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Senha",
                                    style: context.textTheme.labelSmall,
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormFieldDefault(
                                    hintText: "Senha",
                                    controller: passwordController,
                                    isPassword: true,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              TextButton(
                                onPressed: () =>
                                    context.pushNamed("forgot-password"),
                                child: Text(
                                  "Esqueceu sua senha?",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: context.colorScheme.primary,
                                      ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    CircularButtonDefault(
                      title: "Entrar",
                      backgroundColor: context.colorScheme.primary,
                      style: context.textTheme.bodyMedium,
                      onPressed: () => bloc.add(
                        SignInUserEmail(
                            emailController.text, passwordController.text),
                      ),
                      isLoading:
                          state is SignInAuthLoadingState && state.isLoading,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
