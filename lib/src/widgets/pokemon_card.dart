import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:intl/intl.dart";

import "package:pokedex_app/src/models/pokemon_model.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/shared/utils/pokemon_utils.dart";

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
                        fit: BoxFit.fill,
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

class PokemonType extends StatelessWidget {
  final Type type;

  const PokemonType({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final utilsPokemon = PokemonUtils();

    final colorType = utilsPokemon.verifyTypePokemonColor(
      type: type.type?.name,
    );

    final iconType = utilsPokemon.verifyTypePokemonAsset(
      type: type.type?.name,
    );

    final titleType = utilsPokemon.verifyTypePokemonTitle(
      type: type.type?.name,
    );

    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: colorType,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SvgPicture.asset(
              iconType,
              width: 12,
              colorFilter: ColorFilter.mode(colorType, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            titleType,
            style: context.textTheme.labelSmall?.copyWith(fontSize: 11),
          )
        ],
      ),
    );
  }
}
