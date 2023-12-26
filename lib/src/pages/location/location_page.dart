import "package:flutter/material.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Location",
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
