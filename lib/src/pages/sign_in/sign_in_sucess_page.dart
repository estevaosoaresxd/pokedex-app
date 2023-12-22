import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";

class SignInSucessPage extends StatelessWidget {
  const SignInSucessPage({super.key});

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
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsPaths.devilBoyBlackAndGirlBlack,
                    ),
                    Text(
                      "Bem-vindo de volta, Treinador!",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Esperamos que tenha tido uma longa jornada desde a última vez em que nos visitou.",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    CircularButtonDefault(
                      title: "Continuar",
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      onPressed: () => context.goNamed("home"),
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
