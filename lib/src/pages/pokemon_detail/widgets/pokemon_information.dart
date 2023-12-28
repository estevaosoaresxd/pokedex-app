import "package:flutter/material.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

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
