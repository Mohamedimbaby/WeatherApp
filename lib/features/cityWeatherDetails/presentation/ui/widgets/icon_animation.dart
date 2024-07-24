import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/enum/day_state.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/domain/models/city_weather_model.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/ui/city_weather_details_screen.dart';

class IconAnimation extends StatelessWidget {
  final CityWeatherModel item ;
  final AnimationController? controller;
  final DayState? currentState;

  const IconAnimation({required this.item
    ,required this.controller,
    required this.currentState,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: controller!,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(0, -10 * controller!.value),
            child: Image.asset(getCurrentIcon(currentState!,item.currentWeather.weathercode),height: MediaQuery.of(context).size.height * .2,)
        );
      },
    );
  }
}
