import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/colors/app_colors.dart';

class AppTextStyles {
  static  TextStyle headline  = const TextStyle(
    fontFamily: "LobsterTwo",
    fontSize: 24,
    color: AppColors.background,
    fontWeight: FontWeight.bold
  );
  static  TextStyle h2  = const TextStyle(
    fontSize: 16,
    color: AppColors.mainColor,
    fontWeight: FontWeight.bold
  );

  static  TextStyle h3  = const TextStyle(
    fontSize: 12,
    color: AppColors.mainColor,
    fontWeight: FontWeight.w400
  );
}