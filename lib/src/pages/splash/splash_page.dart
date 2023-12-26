import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed("onboarding"),
    );

    return Scaffold(
      backgroundColor: context.colorScheme.secondary,
      body: Center(
        child: SvgPicture.asset(
          AssetsPaths.logoSvg,
        ),
      ),
    );
  }
}
