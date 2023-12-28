import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/models/pokemon_model.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/pokemon_type.dart";

class PokemonDetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.33,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.green[300],
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(180),
                          bottomLeft: Radius.circular(180),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetsPaths.grassType,
                            width: size.height * 0.2,
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.5),
                              BlendMode.srcIn,
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 15,
                            child: IconButton(
                              onPressed: () => context.pop(),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 15,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: size.height * 0.17,
                        height: size.height * 0.17,
                        child: Image.network(
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/1.gif",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bulbasaur",
                      style:
                          context.textTheme.titleLarge?.copyWith(fontSize: 32),
                    ),
                    Text(
                      "Nº 001",
                      style: context.textTheme.labelMedium,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        PokemonType(
                          type: Type(
                            type: Species(name: "grass"),
                          ),
                          biggest: true,
                        ),
                        PokemonType(
                          type: Type(
                            type: Species(name: "poison"),
                          ),
                          biggest: true,
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Há uma semente de planta nas costas desde o dia em que este Pokémon nasce. A semente cresce lentamente.",
                      style: context.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: Colors.grey[200],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Expanded(
                          child: PokemonInformation(
                            title: "Peso",
                            icon: Icons.monitor_weight_outlined,
                            description: "6,9 kg",
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: PokemonInformation(
                            title: "Altura",
                            icon: Icons.height,
                            description: "0,7 m",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(
                          child: PokemonInformation(
                            title: "Categoria",
                            icon: Icons.category_outlined,
                            description: "Seed",
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: PokemonInformation(
                            title: "Habilidade",
                            icon: Icons.catching_pokemon,
                            description: "Overgrow",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "GÊNERO",
                          style: context.textTheme.labelMedium?.copyWith(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: 0.875,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(15),
                          backgroundColor: Colors.pinkAccent.shade100,
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.woman_2,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "87,5%",
                                  style: context.textTheme.labelMedium
                                      ?.copyWith(fontSize: 12),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.woman_2,
                                  size: 16,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "12,5%",
                                  style: context.textTheme.labelMedium
                                      ?.copyWith(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Fraquezas",
                          style: context.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: PokemonType(
                                type: Type(
                                  type: Species(name: "fire"),
                                ),
                                biggest: true,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: PokemonType(
                                type: Type(
                                  type: Species(name: "psychic "),
                                ),
                                biggest: true,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: PokemonType(
                                type: Type(
                                  type: Species(name: "flying"),
                                ),
                                biggest: true,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: PokemonType(
                                type: Type(
                                  type: Species(name: "ice"),
                                ),
                                biggest: true,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Evoluções",
                          style: context.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 15),
                      ],
                    )
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

class PokemonInformation extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  const PokemonInformation({
    super.key,
    required this.title,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title.toUpperCase(),
              style: context.textTheme.labelMedium?.copyWith(
                fontSize: 12,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            description,
            style: context.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
