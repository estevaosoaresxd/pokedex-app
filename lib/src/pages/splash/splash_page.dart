import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: SvgPicture.asset(
          AssetsPaths.logoSvg,
        ),
      ),
    );
  }
}
