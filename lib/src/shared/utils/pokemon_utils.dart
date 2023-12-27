import "package:flutter/material.dart";
import "package:pokedex_app/src/shared/constants/assets_paths.dart";

class PokemonUtils {
  Color verifyTypePokemonColor({required String? type}) {
    switch (type) {
      case "grass":
        return const Color(0xFF63BC5A);
      case "poison":
        return const Color(0XFFB567CE);
      case "fire":
        return const Color(0xFFFF9D55);
      case "flying":
        return const Color(0xFF89AAE3);
      case "water":
        return const Color(0xFF5090D6);
      case "bug":
        return const Color(0xFF91C12F);
      case "normal":
        return const Color(0xFF919AA2);
      case "electric":
        return const Color(0xFFF4D23C);
      case "ground":
        return const Color(0xFFD97845);
      case "fairy":
        return const Color(0xFFEC8FE6);
      case "fighting":
        return const Color(0xFFCE416B);
      case "psychic":
        return const Color(0xFFFA7179);
      case "rock":
        return const Color(0xFFC5B78C);
      case "ice":
        return const Color(0xFF73CEC0);
      case "dragon":
        return const Color(0xFF0B6DC3);
      case "ghost":
        return const Color(0xFF5269AD);
      case "dark":
        return const Color(0xFF5A5465);
      case "steel":
        return const Color(0xFF5A8EA2);
      default:
        return const Color(0xFF63BC5A);
    }
  }

  String verifyTypePokemonAsset({required String? type}) {
    switch (type) {
      case "grass":
        return AssetsPaths.grassType;
      case "poison":
        return AssetsPaths.poisonType;
      case "fire":
        return AssetsPaths.fireType;
      case "flying":
        return AssetsPaths.flyingType;
      case "water":
        return AssetsPaths.waterType;
      case "bug":
        return AssetsPaths.bugType;
      case "normal":
        return AssetsPaths.normalType;
      case "electric":
        return AssetsPaths.eletricType;
      case "ground":
        return AssetsPaths.groundType;
      case "fairy":
        return AssetsPaths.fairyType;
      case "fighting":
        return AssetsPaths.fightingType;
      case "psychic":
        return AssetsPaths.psychicType;
      case "rock":
        return AssetsPaths.rockType;
      case "ice":
        return AssetsPaths.iceType;
      case "dragon":
        return AssetsPaths.dragonType;
      case "ghost":
        return AssetsPaths.ghostType;
      case "dark":
        return AssetsPaths.darkType;
      case "steel":
        return AssetsPaths.steelType;
      default:
        return AssetsPaths.grassType;
    }
  }

  String verifyTypePokemonTitle({required String? type}) {
    switch (type) {
      case "grass":
        return "Grama";
      case "poison":
        return "Venenoso";
      case "fire":
        return "Fogo";
      case "flying":
        return "Voador ";
      case "water":
        return "Água";
      case "bug":
        return "Inseto";
      case "normal":
        return "Normal";
      case "electric":
        return "Elétrico";
      case "ground":
        return "Terrestre";
      case "fairy":
        return "Fada";
      case "fighting":
        return "Lutador";
      case "psychic":
        return "Psíquico";
      case "rock":
        return "Pedra";
      case "ice":
        return "Gelo";
      case "dragon":
        return "Dragão";
      case "ghost":
        return "Fantasma";
      case "dark":
        return "Noturno";
      case "steel":
        return "Metal";
      default:
        return "Grama";
    }
  }
}
