import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:pokedex_app/src/pages/favorite/favorite_page.dart";
import "package:pokedex_app/src/pages/location/location_page.dart";
import "package:pokedex_app/src/pages/pokedex/pokedex_page.dart";
import "package:pokedex_app/src/pages/profile/profile_page.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

    final List<Widget> widgetOptions = [
      const PokedexPage(),
      const LocationPage(),
      const FavoritePage(),
      const ProfilePage()
    ];

    return ValueListenableBuilder(
      valueListenable: selectedIndex,
      builder: (context, value, _) => Scaffold(
        body: widgetOptions[value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: value,
          onTap: (value) => selectedIndex.value = value,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: context.colorScheme.primary,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsPaths.logoPokemonDisabled),
              activeIcon: SvgPicture.asset(AssetsPaths.logoPokemonActived),
              label: "Pokedéx",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsPaths.logoLocationDisabled),
              activeIcon: SvgPicture.asset(AssetsPaths.logoLocationActived),
              label: "Regiões",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsPaths.logoFavoritesDisabled),
              activeIcon: SvgPicture.asset(AssetsPaths.logoFavoritesActived),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetsPaths.logoProfileDisabled),
              activeIcon: SvgPicture.asset(AssetsPaths.logoProfileActived),
              label: "Conta",
            )
          ],
        ),
      ),
    );
  }
}
