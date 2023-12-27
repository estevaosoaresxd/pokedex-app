import "package:flutter/material.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/shared/utils/pokemon_utils.dart";

class BottomSheetType extends StatelessWidget {
  const BottomSheetType({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    final PokemonUtils utils = PokemonUtils();

    return Container(
      height: size.height * 0.65,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Selecione o tipo",
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: utils.types.length + 1,
              padding: const EdgeInsets.only(
                bottom: 20,
                top: 10,
              ),
              itemBuilder: (context, i) {
                if (i == 0) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(42),
                      backgroundColor: Colors.black87,
                    ),
                    child: Text(
                      "Todos os tipos",
                      style: context.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  );
                }

                final type = utils.types[i - 1];

                return ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(42),
                    backgroundColor: utils.verifyTypePokemonColor(type: type),
                  ),
                  child: Text(
                    utils.verifyTypePokemonTitle(type: type),
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 6),
            ),
          ),
        ],
      ),
    );
  }
}
