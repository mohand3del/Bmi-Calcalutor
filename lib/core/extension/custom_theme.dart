import 'package:flutter/material.dart';

class CustomThemeExtension implements ThemeExtension<CustomThemeExtension> {
  CustomThemeExtension({
     this.buttonColor,
     this.buttonBgColor,
     this.buttonFgColor,
     this.cardColor,
     this.appBarTitleColor,
     this.textColor,
  });

  final Color? buttonColor; // color of the button
  final Color? buttonBgColor; // background color of the button
  final Color? buttonFgColor; // foreground color of the button
  final Color? appBarTitleColor;
  final Color? cardColor;
  final Color? textColor;

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? buttonColor,
    Color? buttonBgColor,
    Color? buttonFgColor,
    Color? appBarTitleColor,
    Color? cardColor,
    Color? textColor,
  }) {
    return CustomThemeExtension(
      buttonColor: buttonColor ?? this.buttonColor,
      buttonBgColor: buttonBgColor ?? this.buttonBgColor,
      buttonFgColor: buttonFgColor ?? this.buttonFgColor,
      cardColor: cardColor ?? this.cardColor,
      appBarTitleColor: appBarTitleColor ?? this.appBarTitleColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      covariant ThemeExtension<CustomThemeExtension>? other, double t) {
    return this;
  }

  @override
  Object get type => CustomThemeExtension;
}

extension ExtendedThemeExtension on BuildContext {
  CustomThemeExtension get theme =>
      Theme.of(this).extension<CustomThemeExtension>()!;
}