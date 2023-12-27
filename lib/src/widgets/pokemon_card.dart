import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:intl/intl.dart";
import "package:pokedex_app/src/models/pokemon_model.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[50],
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
                        Container(
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
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
                                  AssetsPaths.grassType,
                                  width: 12,
                                  color: Colors.green[400],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Grama",
                                style: context.textTheme.labelSmall
                                    ?.copyWith(fontSize: 11),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent[100],
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
                                  AssetsPaths.poisonType,
                                  width: 12,
                                  color: Colors.deepPurpleAccent[100],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Venenoso",
                                style: context.textTheme.labelSmall
                                    ?.copyWith(fontSize: 11),
                              )
                            ],
                          ),
                        ),
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
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(15),
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
                    ),
                    Image.network(
                      "https://img.pokemondb.net/sprites/black-white/normal/bulbasaur.png",
                      fit: BoxFit.fill,
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
