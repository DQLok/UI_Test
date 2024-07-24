import 'package:flutter/material.dart';

class ColorsApp {
  static Color primary = HexColor.fromHex("#0A8ED9");
  static Color parent = Colors.transparent;
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
