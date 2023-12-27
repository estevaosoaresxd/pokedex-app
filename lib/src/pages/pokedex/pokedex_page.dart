import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";
import "package:pokedex_app/src/shared/extensions/context_extension.dart";
import "package:pokedex_app/src/widgets/bottom_sheer_order_by.dart";
import "package:pokedex_app/src/widgets/bottom_sheet_type.dart";
import "package:pokedex_app/src/widgets/text_form_field_default.dart";

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        surfaceTintColor: Colors.white,
        shape: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        title: TextFormFieldDefault(
          hintText: "Procurar Pókemon...",
          controller: TextEditingController(),
          isSearch: true,
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => showModalBottomSheet(
                      showDragHandle: true,
                      enableDrag: true,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => const BottomSheetType(),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Todos os Tipos",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => showModalBottomSheet(
                      showDragHandle: true,
                      enableDrag: true,
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) => const BottomSheetOrderBy(),
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Menor número",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
              1,
              (i) => Card(
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
                                "Nº 001",
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                "Bulbasaur",
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.green[400],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent[100],
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(40),
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
                                      backgroundColor:
                                          Colors.black.withOpacity(0.3),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
