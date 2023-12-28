import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/shared/utils/pokemon_utils.dart";
import "package:pokedex_app/src/models/pokemon_model.dart";

class PokemonType extends StatelessWidget {
  final Type type;
  final bool biggest;

  const PokemonType({
    Key? key,
    required this.type,
    this.biggest = false,
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
      height: biggest ? 40 : 28,
      padding: EdgeInsets.symmetric(horizontal: biggest ? 15 : 6),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: colorType,
        borderRadius: BorderRadius.circular(biggest ? 30 : 20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: SvgPicture.asset(
                iconType,
                width: biggest ? 16 : 12,
                height: biggest ? 16 : 12,
                colorFilter: ColorFilter.mode(colorType, BlendMode.srcIn),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            titleType,
            style: context.textTheme.labelSmall
                ?.copyWith(fontSize: biggest ? 14 : 11),
          )
        ],
      ),
    );
  }
}
