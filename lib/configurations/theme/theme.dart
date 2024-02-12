import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'size_constants.dart';
import 'typography.dart';

export 'colors.dart';
export 'size_constants.dart';
export 'typography.dart';

class AppTheme {
  static final buttonTextStyle = MaterialStatePropertyAll(
    AppTextStyle.bodyLarge.copyWith(fontWeight: FontWeight.w600, fontSize: 15, wordSpacing: 0.2, height: 1.06),
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      vertical: kPadding * 2,
      horizontal: kPadding * 1.5,
    ),
    hintStyle: AppTextStyle.labelMedium.copyWith(height: 2),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(kButtonRadius),
      ),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
  );

  // Shared sub theme data for light, darktheme.
  static FlexSubThemesData get _commonSubThemeData => FlexSubThemesData(
        //Global Button properties
        buttonMinSize: const Size(double.infinity, kButtonHeight),
        buttonPadding: const EdgeInsets.symmetric(
          horizontal: kPadding * 2,
          vertical: 0,
        ),
        //Text Button properties
        textButtonTextStyle: buttonTextStyle,
        textButtonSchemeColor: SchemeColor.primary,
        textButtonRadius: kTextButtonRadius,

        //Elevated Button properties
        elevatedButtonRadius: kButtonRadius,
        elevatedButtonTextStyle: buttonTextStyle,
        elevatedButtonSchemeColor: SchemeColor.onPrimary,
        elevatedButtonSecondarySchemeColor: SchemeColor.primary,

        //Outlined Button properties
        outlinedButtonOutlineSchemeColor: SchemeColor.primary,
        outlinedButtonSchemeColor: SchemeColor.primary,
        outlinedButtonBorderWidth: 1,
        outlinedButtonRadius: kButtonRadius,
        outlinedButtonTextStyle: buttonTextStyle,

        //Checkbox properties
        checkboxSchemeColor: SchemeColor.primary,

        // inputDecoratorSchemeColor: SchemeColor.primary,
        fabSchemeColor: SchemeColor.primary,
        chipSchemeColor: SchemeColor.primary,
        blendOnLevel: 0,
        blendOnColors: false,
        blendTextTheme: false,
        dialogRadius: kPadding * 1.25,

        //BottomNavBar properties
        bottomNavigationBarSelectedIconSize: kPadding * 3,
        bottomNavigationBarUnselectedIconSize: kPadding * 3,
        bottomNavigationBarShowUnselectedLabels: true,
        bottomNavigationBarShowSelectedLabels: true,
        bottomNavigationBarType: BottomNavigationBarType.shifting,

        //Card properties
        cardRadius: kPadding * 3,

        //InputDecorator properties
        inputDecoratorIsFilled: false,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorBorderWidth: 1,
        inputDecoratorFocusedBorderWidth: 1,
        inputDecoratorRadius: kButtonRadius,

        //Switch properties
        switchSchemeColor: SchemeColor.primary,
      );

  static ThemeData get light {
    final theme = FlexThemeData.light(
      colorScheme: AppColors.lightColorScheme,
      textTheme: AppTextStyle.textTheme,
      surfaceTint: Colors.white,
      primaryTextTheme: AppTextStyle.textTheme.apply(
        bodyColor: AppColors.onPrimary,
        displayColor: AppColors.onPrimary,
        decorationColor: AppColors.onPrimary,
      ),
      usedColors: 2,
      surfaceMode: FlexSurfaceMode.level,
      blendLevel: 9,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      subThemesData: _commonSubThemeData,
      scaffoldBackground: AppColors.surface,
    );

    return theme.copyWith(
      inputDecorationTheme: AppTheme.inputDecorationTheme,
      textButtonTheme: TextButtonThemeData(
        style: theme.textButtonTheme.style?.copyWith(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return AppColors.primary.withOpacity(0.4);
              }
              return AppColors.primary;
            },
          ),
          foregroundColor: const MaterialStatePropertyAll(
            AppColors.onPrimary,
          ),
        ),
      ),
      brightness: Brightness.light,
    );
  }

  static ThemeData get dark {
    final colorScheme = AppColors.darkColorScheme;
    final theme = FlexThemeData.dark(
      colorScheme: colorScheme,
      applyElevationOverlayColor: true,
      textTheme: AppTextStyle.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
        decorationColor: colorScheme.onSurface,
      ),
      primaryTextTheme: AppTextStyle.textTheme.apply(
        bodyColor: AppColors.onPrimaryDark,
        displayColor: AppColors.onPrimaryDark,
        decorationColor: AppColors.onPrimaryDark,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
      surfaceMode: FlexSurfaceMode.level,
      subThemesData: _commonSubThemeData,
      scaffoldBackground: AppColors.surfaceDark,
      appBarStyle: FlexAppBarStyle.background,
    );
    return theme.copyWith(
      inputDecorationTheme: AppTheme.inputDecorationTheme,
    );
  }
}
