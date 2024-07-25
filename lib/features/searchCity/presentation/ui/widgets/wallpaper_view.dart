import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/assets/app_assets.dart';

class WallpaperView extends StatelessWidget {
  const WallpaperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.rain),
          // Add your background image here
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
