import 'package:flutter/material.dart';

class WallpaperView extends StatelessWidget {
  const WallpaperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/rain.gif'),
          // Add your background image here
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
