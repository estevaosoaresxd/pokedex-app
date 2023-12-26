import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_default.dart";
import "package:pokedex_app/src/widgets/text_form_field_pin.dart";

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    final ValueNotifier<bool> isCode = ValueNotifier<bool>(false);

    void nextStep() {
      if (!isCode.value) {
        isCode.value = true;
      } else {
        context.goNamed("sign-in-sucess");
      }
    }

    String stepTitleBottom() {
      return isCode.value ? "Insira o código" : "Qual é o seu e-mail?";
    }

    String stepLabelBottom() {
      return isCode.value
          ? "Não recebeu o código? "
          : "Vamos enviar um código de verificação para o seu e-mail.";
    }

    Widget stepFormField() {
      return isCode.value
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
              controller: TextEditingController(),
              textInputType: TextInputType.emailAddress,
            );
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
            valueListenable: isCode,
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
                            onPressed: () => context.goNamed("sign-in-auth"),
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
                          if (!isCode.value) ...[
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
                            stepTitleBottom(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          if (isCode.value) ...[
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
                      stepFormField(),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        stepLabelBottom(),
                        style: context.textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (isCode.value) ...[
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
