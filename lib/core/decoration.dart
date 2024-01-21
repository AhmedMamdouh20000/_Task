import 'package:flutter/material.dart';

class Decorations {
  static BoxDecoration kDecorationOnlyRadius({
    Color? color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
    );
  }

  static BoxDecoration kDecorationSpecificRadius({
    Color? color,
    double topRight = 0,
    double topLeft = 0,
    double bottomRight = 0,
    double bottomLeft = 0,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomRight: Radius.circular(bottomRight),
        bottomLeft: Radius.circular(bottomLeft),
      ),
    );
  }

  static BoxDecoration kDecorationShape({
    BoxShape shape = BoxShape.circle,
    Color? color,
    Color? borderColor,
    double? borderWidth,
    BorderStyle? borderStyle,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      shape: shape,
      border: Border.all(
        color: borderColor ?? Colors.transparent,
        width: borderWidth ?? 0,
        style: borderStyle ?? BorderStyle.solid,
      ),
    );
  }

  static BoxDecoration kDecorationLinearGradient() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(102, 200, 206, 1),
            Color.fromRGBO(80, 227, 194, 1)
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ]);
  }

  static BoxDecoration kDecorationBoxShadow({
    Color? color,
    Color? colorShadow,
    double blurRadius = 5,
    double spreadRadius = 4,
    double radius = 12,
    BorderRadius? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Offset offset = const Offset(0, 0),
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: colorShadow ?? Colors.yellow.withOpacity(0.5),
          blurRadius: 1.2,
          spreadRadius: 2,
          offset: offset,
        ),
      ],
      border: Border.all(
        color: borderColor ?? Colors.white,
        width: borderWidth ?? 0,
        style: BorderStyle.solid,
      ),
    );
  }

  static BoxDecoration kDecorationBorderRadius({
    Color? color,
    required BorderRadiusDirectional borderRadius,
    Color? colorShadow,
    double? blurRadius,
    double? spreadRadius,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: colorShadow ?? Colors.grey.withOpacity(0.2),
          blurRadius: blurRadius ?? 3,
          spreadRadius: spreadRadius ?? 3,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }

  static BoxDecoration kDecorationBoxShadowCircle(
      {Color? color,
        Color? colorShadow,
        double? blurRadius,
        int? spreadRadius}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: colorShadow ?? Colors.grey.withOpacity(0.2),
          blurRadius: blurRadius ?? 3,
          offset: const Offset(0, 0),
        ),
      ],
    );
  }

  static BoxDecoration kDecorationBorder({
    Color? backgroundColor,
    double? radius,
    BorderRadiusDirectional? borderRadius,
    Color? borderColor,
    double? borderWidth,
    BorderStyle? borderStyle,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? Colors.white,
      borderRadius: borderRadius ??
          BorderRadius.all(
            Radius.circular(radius ?? 16),
          ),
      border: Border.all(
        color: borderColor ?? Colors.transparent,
        width: borderWidth ?? 0,
        style: borderStyle ?? BorderStyle.solid,
      ),
    );
  }

  static BoxDecoration kDecorationBottomBorder({
    Color? backgroundColor,
    double? radius,
    BorderRadius? borderRadius,
    Color? borderColor,
    double? borderWidth,
    BorderStyle? borderStyle,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? Colors.white,
      border: Border(
        bottom: BorderSide(
          color: borderColor ?? Colors.black45,
          width: borderWidth ?? 0,
          style: borderStyle ?? BorderStyle.solid,
        ),
      ),
    );
  }
}
