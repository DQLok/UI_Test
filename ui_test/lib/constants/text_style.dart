// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:ui_test/constants/colors_app.dart';
import 'package:ui_test/constants/dimens_app.dart';
import 'package:ui_test/constants/fonts_app.dart';

enum TextStyleApp {
  inter_s10_t_black,
  inter_s10_t_white,
  inter_s10_m_white,
  inter_s10_m_primary,
  inter_s10_m_grey,
  inter_s10_m_black,
  inter_s15_m_white,
  inter_s15_m_primary,
  inter_s15_m_black,
  inter_s15_m_grey,
  inter_s15_sb_black,
  inter_s20_b_white
}

extension TextStyleExtention on TextStyleApp {
  TextStyle _textStyle(
      {required Color color,
      required String family,
      required double size,
      FontWeight? weight,
      TextDecoration? decoration}) {
    return TextStyle(
        color: color,
        fontFamily: family,
        fontSize: size,
        fontWeight: weight,
        decoration: decoration);
  }

  TextStyle get style {
    final interT = FontApp.interThin.font;
    final interR = FontApp.interRegular.font;
    final interM = FontApp.interMedium.font;
    final interSB = FontApp.interSemiBold.font;
    final interB = FontApp.interBold.font;

    switch (this) {
      case TextStyleApp.inter_s10_t_black:
        return _textStyle(
            color: ColorsApp.primary, family: interT, size: DimensApp.size10);
      case TextStyleApp.inter_s10_t_white:
        return _textStyle(
            color: Colors.white, family: interT, size: DimensApp.size10);
      case TextStyleApp.inter_s10_m_white:
        return _textStyle(
            color: Colors.white, family: interM, size: DimensApp.size10);
      case TextStyleApp.inter_s10_m_primary:
        return _textStyle(
            color: ColorsApp.primary, family: interM, size: DimensApp.size10);
      case TextStyleApp.inter_s10_m_grey:
        return _textStyle(
            color: Colors.grey, family: interM, size: DimensApp.size10);
      case TextStyleApp.inter_s10_m_black:
        return _textStyle(
            color: Colors.black, family: interM, size: DimensApp.size10);
      case TextStyleApp.inter_s15_m_white:
        return _textStyle(
            color: Colors.white, family: interM, size: DimensApp.size15);
      case TextStyleApp.inter_s15_m_primary:
        return _textStyle(
            color: ColorsApp.primary, family: interM, size: DimensApp.size15);
      case TextStyleApp.inter_s15_m_black:
        return _textStyle(
            color: Colors.black, family: interM, size: DimensApp.size15);
      case TextStyleApp.inter_s15_m_grey:
        return _textStyle(
            color: Colors.grey, family: interM, size: DimensApp.size15);
      case TextStyleApp.inter_s15_sb_black:
        return _textStyle(
            color: Colors.black, family: interSB, size: DimensApp.size15);
      case TextStyleApp.inter_s20_b_white:
        return _textStyle(
            color: Colors.white, family: interB, size: DimensApp.size15);
      default:
        return _textStyle(
            color: ColorsApp.primary, family: interR, size: DimensApp.size10);
    }
  }
}
