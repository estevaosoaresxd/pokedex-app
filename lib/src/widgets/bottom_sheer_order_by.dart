import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";

class BottomSheetOrderBy extends StatelessWidget {
  const BottomSheetOrderBy({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> order = [
      "ASC-NUMBER",
      "DESC-NUMBER",
      "ASC-LETTER",
      "DESC-LETTER"
    ];

    String titleOrder({required String order}) {
      switch (order) {
        case "ASC-NUMBER":
          return "Menor número";
        case "DESC-NUMBER":
          return "Maior número";
        case "ASC-LETTER":
          return "A-Z";
        case "DESC-LETTER":
          return "Z-A";
        default:
          return "Menor número";
      }
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Selecione a ordem",
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...order.map(
            (orderBy) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () => context.pop({
                    "orderBy": orderBy,
                  }),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(42),
                    backgroundColor: Colors.black87,
                  ),
                  child: Text(
                    titleOrder(order: orderBy),
                    style: context.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 6)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
