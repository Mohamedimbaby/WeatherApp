
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/core/assets/app_assets.dart';
import 'package:simple_weather_app/core/colors/app_colors.dart';
import 'package:simple_weather_app/core/dependency_injection/dependency_injection.dart';
import 'package:simple_weather_app/core/enum/day_state.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/domain/models/city_weather_model.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/cubit/city_weather_details_cubit.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/cubit/city_weather_details_state.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/ui/widgets/city_details_weather_section.dart';
import 'package:simple_weather_app/features/searchCity/domain/ui_models/city_model.dart';

class CityWeatherDetailsScreen extends StatefulWidget {
  final CityModel cityModel ;
  const CityWeatherDetailsScreen({required this.cityModel,super.key});

  @override
  State<CityWeatherDetailsScreen> createState() => CityWeatherDetailsScreenState();
}


class CityWeatherDetailsScreenState extends State<CityWeatherDetailsScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  CityWeatherDetailsCubit cityWeatherDetailsCubit = getIt<CityWeatherDetailsCubit>();
  DayState? currentState ;
  @override
  void initState() {
    super.initState();
    currentState = getTimeOfDay();
    cityWeatherDetailsCubit.getCityWeatherDetails(widget.cityModel.lat, widget.cityModel.lng);
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: currentState == DayState.morning ?
              Image.asset(AppAssets.morningBg,fit: BoxFit.cover,):
              Image.asset(AppAssets.nightBg,fit: BoxFit.cover,)
          ),
          BlocBuilder<CityWeatherDetailsCubit, CityWeatherDetailsState>(
            bloc: cityWeatherDetailsCubit,
            builder: (context, state) {
              if(state is EmptyCityWeatherDetailsState || state is CityWeatherDetailsLoadingState){
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child:  CircularProgressIndicator(color: AppColors.mainColor,)));
              }else if (state is CityWeatherDetailsResultState){
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 60,),
                          _buildSunAnimation(state.item),
                          _buildWeatherInfo(state.item),
                        ],
                      ),
                      CityWeatherDetailsSection(item: state.item,current: currentState!,)

                    ],
                  ),
                );
              }
              else {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Text((state as CityWeatherDetailsErrorState).error),
                  ),
                );
              }
            }
          ),
        ],
      ) ,      
    );
  }
  DayState getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 6 && hour < 18) {
      return DayState.morning;
    } else {
      return DayState.night;
    }
  }
  Widget _buildWeatherInfo(CityWeatherModel item) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
             "${item.currentWeather.temperature}°C",
            style: const TextStyle(
              fontSize: 60,
              color: AppColors.background,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.cityModel.summary,
            style: const TextStyle(
              fontSize: 36,
              color: AppColors.background,
            ),
          ),
          const SizedBox(height: 20),

        ],
      ),
    );
  }
  Widget _buildSunAnimation(CityWeatherModel item) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -10 * _controller!.value),
          child: Image.asset(getCurrentIcon(currentState!,item.currentWeather.weathercode),height: MediaQuery.of(context).size.height * .2,)
        );
      },
    );
  }


}

String getCurrentIcon(DayState currentState ,int weatherCode) {
  // Refer to Open-Meteo API documentation for weather codes
  switch (weatherCode) {
    case 0:
      return currentState == DayState.morning ? AppAssets.sunny : AppAssets.cloud;
    case 1:
      return currentState == DayState.morning ? AppAssets.sunny : AppAssets.cloud;
    case 2:
      return currentState == DayState.morning ? AppAssets.partlyCloud : AppAssets.cloud;
    case 3:
      return currentState == DayState.morning ? AppAssets.partlyCloud : AppAssets.cloud;
    case 45:
    case 48:
      return currentState == DayState.morning ? AppAssets.partlyCloud : AppAssets.cloud;
    case 51:
    case 53:
    case 55:
      return  AppAssets.rainIcon ;
    case 56:
    case 57:
      return  AppAssets.rainIcon ;
    case 61:
    case 63:
    case 65:
      return  AppAssets.rainIcon ;
    case 66:
    case 67:
      return  AppAssets.rainIcon ;
    case 71:
    case 73:
    case 75:
      return  AppAssets.snow ;
    case 77:
      return  AppAssets.snow ;
    case 80:
    case 81:
    case 82:
      return  AppAssets.rainIcon ;
    case 85:
    case 86:
      return  AppAssets.snow ;
    case 95:
      return  AppAssets.thunder ;
    case 96:
    case 99:
      return  AppAssets.thunder ;
    default:
      return 'Unknown weather';
  }
}