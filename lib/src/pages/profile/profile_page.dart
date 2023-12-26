import "package:flutter/material.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profile",
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
