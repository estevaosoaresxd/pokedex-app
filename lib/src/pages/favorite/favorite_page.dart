import "package:flutter/material.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favorite",
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
