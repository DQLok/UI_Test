enum FontApp {
  interThin,
  interExtraLight,
  interLight,
  interRegular,
  interMedium,
  interSemiBold,
  interBold,
  interExtraBold,
  interBlack
}

extension FontAppExtension on FontApp {
  String get font {
    switch (this) {
      case FontApp.interThin:
        return "Inter_Thin";
      case FontApp.interExtraLight:
        return "Inter_ExtraLight";
      case FontApp.interLight:
        return "Inter_Light";
      case FontApp.interRegular:
        return "Inter_Regular";
      case FontApp.interMedium:
        return "Inter_Medium";
      case FontApp.interSemiBold:
        return "Inter_SemiBold";
      case FontApp.interBold:
        return "Inter_Bold";
      case FontApp.interExtraBold:
        return "Inter_ExtraBold";
      case FontApp.interBlack:
        return "Inter_Black";
    }
  }
}
