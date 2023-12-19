import 'package:flutter/material.dart';

import '../../controllers/utils/app_colors.dart';

class PrimaryCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final double? width;
  final bool needShadow;
  final bool needBorder;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? cardColor;
  final String? image;
  final VoidCallback? onPressed;
  final List<BoxShadow>? customShadow;

  const PrimaryCard({
    super.key,
    required this.child,
    this.needShadow = true,
    this.needBorder = false,
    this.padding,
    this.margin,
    this.radius = 60.0,
    this.cardColor,
    this.image,
    this.onPressed,
    this.width,
    this.customShadow,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: cardColor ?? Colors.white,
          border:
              needBorder ? Border.all(color: AppColors.textLightColor) : null,
          borderRadius: BorderRadius.circular(radius),
          image: image != null
              ? DecorationImage(
                  image: AssetImage(image!),
                  fit: BoxFit.fill,
                )
              : null,
          boxShadow: needShadow
              ? customShadow ??
                  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(
                        -1,
                        1,
                      ), // changes position of shadow
                    ),
                  ]
              : null,
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 2.0,
              horizontal: 20.0,
            ),
        child: child,
      ),
    );
  }
}
