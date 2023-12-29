import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class PokemonMiniCardLevel extends StatelessWidget {
  const PokemonMiniCardLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 76,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(60),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetsPaths.grassType,
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.5),
                          BlendMode.srcIn,
                        ),
                        height: 60,
                      ),
                      SizedBox(
                        height: 76,
                        child: Image.network(
                          "https://img.pokemondb.net/sprites/black-white/normal/bulbasaur.png",
                          fit: BoxFit.fitWidth,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Bulbasaur",
                      style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Nº 001",
                      style: context.textTheme.labelMedium?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Container(
                          width: 75,
                          height: 13,
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SvgPicture.asset(
                            AssetsPaths.grassType,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 75,
                          height: 13,
                          padding: const EdgeInsets.symmetric(vertical: 1),
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SvgPicture.asset(
                            AssetsPaths.poisonType,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_circle_down,
                color: context.colorScheme.primary,
                size: 36,
              ),
              const SizedBox(width: 8),
              Text(
                "Nível 16",
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.primary,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
