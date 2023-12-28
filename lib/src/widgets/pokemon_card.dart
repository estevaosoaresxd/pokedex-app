import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:intl/intl.dart";

import "package:pokedex_app/src/models/pokemon_model.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/shared/utils/pokemon_utils.dart";
import "package:pokedex_app/src/widgets/pokemon_type.dart";

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final utilsPokemon = PokemonUtils();

    final colorTypeStandard = utilsPokemon.verifyTypePokemonColor(
      type: pokemon.types!.first.type!.name,
    );

    final iconTypeStandard = utilsPokemon.verifyTypePokemonAsset(
      type: pokemon.types!.first.type!.name,
    );

    return Card(
      color: colorTypeStandard.withOpacity(0.1),
      child: SizedBox(
        height: 105,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nº ${pokemon.id.toString().padLeft(3, '0')}",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      toBeginningOfSentenceCase(pokemon.name) ?? "Sem nome",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontSize: 21,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        ...pokemon.types!.map(
                          (type) => PokemonType(type: type),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 6,
                  bottom: 6,
                ),
                decoration: BoxDecoration(
                  color: colorTypeStandard,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      iconTypeStandard,
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.5),
                        BlendMode.srcIn,
                      ),
                    ),
                    if (pokemon.sprites?.frontDefault != null)
                      Image.network(
                        pokemon.sprites!.frontDefault!,
                        fit: BoxFit.fitHeight,
                      )
                    else
                      const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.white,
                      ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: SizedBox(
                        height: 36,
                        width: 36,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                            size: 20,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(0.3),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
