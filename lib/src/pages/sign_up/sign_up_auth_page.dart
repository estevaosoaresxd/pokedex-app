import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_default.dart";

class SignUpAuthPage extends StatelessWidget {
  const SignUpAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    final ValueNotifier<int> step = ValueNotifier<int>(0);

    void nextStep() {
      step.value < 2 ? step.value++ : context.goNamed("home");
    }

    String stepTitleTop() {
      switch (step.value) {
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

    String stepTitleBottom() {
      switch (step.value) {
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

    String stepLabelBottom() {
      switch (step.value) {
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

    String stepTitleButton() {
      return step.value == 2 ? "Criar conta" : "Continuar";
    }

    Widget stepFormField() {
      switch (step.value) {
        case 0:
          return TextFormFieldDefault(
            hintText: "E-mail",
            controller: TextEditingController(),
            textInputType: TextInputType.emailAddress,
          );
        case 1:
          return TextFormFieldDefault(
            hintText: "Senha",
            controller: TextEditingController(),
            isPassword: true,
            textInputType: TextInputType.visiblePassword,
          );
        case 2:
          return TextFormFieldDefault(
            hintText: "Nome",
            controller: TextEditingController(),
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
          child: ValueListenableBuilder(
            valueListenable: step,
            builder: (context, _, __) => Column(
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
                      Column(
                        children: [
                          Text(
                            stepTitleTop(),
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
                            stepTitleBottom(),
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
                      stepFormField(),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        stepLabelBottom(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 12,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                CircularButtonDefault(
                  title: stepTitleButton(),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  style: Theme.of(context).textTheme.bodyMedium,
                  onPressed: () => nextStep(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
