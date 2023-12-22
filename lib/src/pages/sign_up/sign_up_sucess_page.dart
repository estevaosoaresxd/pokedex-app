import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/widgets/circular_button_default.dart";

class SignUpSucessPage extends StatelessWidget {
  const SignUpSucessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 40, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AssetsPaths.devilBoyBlueAndGirlGreen,
                    ),
                    Text(
                      "Sua conta foi criada com Sucesso!",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Seja bem-vindo, treinador! Estamos animados para acompanhar sua jornada.",
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
