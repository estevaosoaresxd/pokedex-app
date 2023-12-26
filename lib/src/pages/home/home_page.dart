import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AssetsPaths.logoPokemonActived,
                    ),
                    const Text("Pokedéx")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
