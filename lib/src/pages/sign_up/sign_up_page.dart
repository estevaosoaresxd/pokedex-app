import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";
import "package:pokedex_app/src/widgets/outlined_button_default.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          "Criar Conta",
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
                    Image.asset(
                      AssetsPaths.dancerGirl,
                      height: 260,
                    ),
                    Text(
                      "Falta pouco para explorar esse mundo!",
                      style: context.textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Como deseja se conectar?",
                      style: context.textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButtonDefault(
                          onPressed: () {},
                          icon: Icons.apple,
                          title: "Continuar com a Apple",
                        ),
                        const SizedBox(height: 12),
                        OutlinedButtonDefault(
                          onPressed: () {},
                          icon: Icons.apple,
                          iconOutside: SvgPicture.asset(
                            AssetsPaths.logoGoogleSvg,
                            width: 30,
                            height: 30,
                          ),
                          title: "Continuar com o Google",
                        ),
                        const SizedBox(height: 12),
                        CircularButtonDefault(
                          title: "Continuar com um e-mail",
                          backgroundColor: context.colorScheme.primary,
                          style: context.textTheme.bodyMedium,
                          onPressed: () => context.goNamed("sign-up-auth"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
