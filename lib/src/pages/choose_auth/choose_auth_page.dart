import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";

class ChooseAuthPage extends StatelessWidget {
  const ChooseAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: top,
              child: TextButton.icon(
                onPressed: () => context.goNamed("home"),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
                label: Text(
                  "Pular",
                  style: context.textTheme.headlineSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AssetsPaths.trainerGirlAndBoy,
                        ),
                        Text(
                          "Está pronto para essa aventura?",
                          style: context.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Basta criar uma conta e começar a explorar o mundo dos Pokémon hoje!",
                          style: context.textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircularButtonDefault(
                              title: "Criar Conta",
                              backgroundColor: context.colorScheme.primary,
                              onPressed: () => context.goNamed("sign-up"),
                            ),
                            TextButton(
                              onPressed: () => context.goNamed("sign-in"),
                              child: Text(
                                "Já tenho uma conta",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: context.colorScheme.primary,
                                    ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
