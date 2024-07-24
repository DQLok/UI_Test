import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_test/constants/colors_app.dart';
import 'package:ui_test/constants/dimens_app.dart';

class ImageCus extends StatelessWidget {
  const ImageCus(
      {super.key,
      this.url,
      this.pngPath,
      this.svgPath,
      this.file,
      this.height,
      this.width,
      this.color,
      this.fit,
      this.placeHolder,
      this.alignment,
      this.onTap,
      this.margin,
      this.radius,
      this.border});
  final String? url;
  final String? pngPath;
  final String? svgPath;
  final File? file;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final String? placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius!,
        child: _buildImageWithBorder(),
      );
    }
    return _buildImageWithBorder();
  }

  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: _buildImageView(),
      );
    }
    return _buildImageView();
  }

  Widget _buildImageView() {
    if (svgPath != null && svgPath!.isEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          // ignore: deprecated_member_use
          color: color,
        ),
      );
    } else if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        color: color,
        placeholder: (context, url) => SizedBox(
          height: DimensApp.size30,
          width: DimensApp.size30,
          child: LinearProgressIndicator(
            color: ColorsApp.primary,
            backgroundColor: ColorsApp.parent,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          placeHolder ?? "",
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
      );
    } else if (pngPath != null && pngPath!.isNotEmpty) {
      return Image.asset(
        pngPath!,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: color,
      );
    }
    return const SizedBox();
  }
}
