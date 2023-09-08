import 'package:flutter/material.dart';

import 'color.dart';

class StyleClass {
  static ThemeData themeData(context) {
    return ThemeData(
        brightness: Brightness.light,
        applyElevationOverlayColor: true,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        androidOverscrollIndicator: AndroidOverscrollIndicator.glow,

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 10,
          backgroundColor: ColorConstants.primaryWhite,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          selectedItemColor: ColorConstants.primaryColor,
          unselectedItemColor: ColorConstants.primaryColor.withOpacity(0.5),
        ),

        appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: ColorConstants.primaryWhite,
            toolbarTextStyle: const TextTheme(
            ).bodyText1,
            titleTextStyle: const TextTheme(
                bodyText1: TextStyle(fontSize: 18,
                    color: ColorConstants.primaryBlack,
                    fontWeight: FontWeight.w600)
            ).bodyText1,
            actionsIconTheme: const IconThemeData(
              color: ColorConstants.primaryBlack,
              size: 24,
            ),
            iconTheme: const IconThemeData(
              color: ColorConstants.primaryBlack,
              size: 24,
            )
        ),

        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity.standard,
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return const TextTheme(
                    subtitle2: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.myRemoveColor
                    )
                ).subtitle2;
              }
              return const TextTheme(
                  subtitle2: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.myRemoveColor
                  )
              ).subtitle2;
            }),
          ),
        ),

        buttonTheme: const ButtonThemeData(
            height: 48,
            textTheme: ButtonTextTheme.primary,
            buttonColor: ColorConstants.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            )
        ),
        iconTheme: const IconThemeData(
          color: ColorConstants.primaryBlack,
          size: 20,
        ),

        fontFamily: "Poppins",
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: ColorConstants.textHighlightBlue,
          selectionHandleColor: ColorConstants.primaryColor,
        ),
        scaffoldBackgroundColor: ColorConstants.primaryWhite,
        hintColor: ColorConstants.textLightBlack1,
        primaryColor: ColorConstants.primaryColor,
        listTileTheme: const ListTileThemeData(
          dense: true,
          visualDensity: VisualDensity.standard,
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.all(Radius.circular(5))
          ),
          style: ListTileStyle.list,
          minVerticalPadding: 10,
          iconColor: ColorConstants.primaryBlack,
          enableFeedback: true,
          tileColor: ColorConstants.primaryWhite,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorConstants.textHighlightBlue,
          elevation: 20,
        ),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: true,
          isCollapsed: true,
          hintStyle: const TextTheme(
              headline6: TextStyle(color: ColorConstants.textLightBlack1)
          ).headline6,
          contentPadding: const EdgeInsets.all(8),
          border: const OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(
                  color: ColorConstants.textLightBlack3,
                  width: 1,
                  style: BorderStyle.solid)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(
                  color: ColorConstants.textLightBlack3,
                  width: 1,
                  style: BorderStyle.solid)),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(
                  color: ColorConstants.textLightBlack3,
                  width: 1,
                  style: BorderStyle.solid)),
          disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              borderSide: BorderSide(
                  color: ColorConstants.textLightBlack3,
                  width: 1,
                  style: BorderStyle.solid
              )
          ),
        )
    );
  }
}