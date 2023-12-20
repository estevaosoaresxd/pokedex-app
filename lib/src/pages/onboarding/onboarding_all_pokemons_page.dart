import "package:flutter/material.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";

class OnboardAllPokemonsPage extends StatelessWidget {
  final Function() onTapContinue;

  const OnboardAllPokemonsPage({super.key, required this.onTapContinue});

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
                      AssetsPaths.littleBoyAndCientistPng,
                    ),
                    Text(
                      "Todos os Pokémons em um só Lugar",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          2,
                          (i) => Hero(
                            tag: i % 2 == 0 ? "default" : "other",
                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 300,
                              ),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: i % 2 == 0 ? 28 : 10,
                              height: 9,
                              decoration: BoxDecoration(
                                color: i % 2 == 0
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
                      title: "Continuar",
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      onPressed: onTapContinue,
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
