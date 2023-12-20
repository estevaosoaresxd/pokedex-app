import "package:flutter/material.dart";
import "package:pokedex_app/src/pages/onboarding/onboarding_all_pokemons_page.dart";
import "package:pokedex_app/src/pages/onboarding/onboarding_start_page.dart";

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            OnboardAllPokemonsPage(
              onTapContinue: () => _pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              ),
            ),
            const OnboardStartPage()
          ],
        ),
      ),
    );
  }
}
