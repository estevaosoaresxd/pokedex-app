import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";

class OnboardStartPage extends StatelessWidget {
  const OnboardStartPage({super.key});

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
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsPaths.trainingGirlPng,
                      height: 250,
                      width: 250,
                    ),
                    Text(
                      "Mantenha sua Pokédex atualizada",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Cadastre-se e mantenha seu perfil, pokémon favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet.",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          2,
                          (i) => Hero(
                            tag: i % 2 == 1 ? "default" : "other",
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: i % 2 == 1 ? 28 : 10,
                              height: 9,
                              decoration: BoxDecoration(
                                color: i % 2 == 1
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    CircularButtonDefault(
                      title: "Vamos começar!",
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      onPressed: () => context.goNamed("choose-auth"),
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
