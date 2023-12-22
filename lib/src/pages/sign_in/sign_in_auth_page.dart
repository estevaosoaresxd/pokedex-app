import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_default.dart";

class SignInAuthPage extends StatelessWidget {
  const SignInAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

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
            child: Column(
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
                            onPressed: () => context.goNamed("choose-auth"),
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
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              const SizedBox(height: 8),
                              TextFormFieldDefault(
                                hintText: "E-mail",
                                controller: TextEditingController(),
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
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              const SizedBox(height: 8),
                              TextFormFieldDefault(
                                hintText: "Senha",
                                controller: TextEditingController(),
                                isPassword: true,
                                textInputType: TextInputType.visiblePassword,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextButton(
                        onPressed: () => context.goNamed("forgot-password"),
                        child: Text(
                          "Esqueceu sua senha?",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      )
                    ],
                  ),
                ),
                CircularButtonDefault(
                  title: "Entrar",
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  style: Theme.of(context).textTheme.bodyMedium,
                  onPressed: () => context.goNamed("sign-in-sucess"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
