import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:simple_weather_app/core/assets/app_assets.dart';
import 'package:simple_weather_app/core/colors/app_colors.dart';
import 'package:simple_weather_app/core/enum/day_state.dart';
import 'package:simple_weather_app/core/textStyles/app_text_styles.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/domain/models/city_weather_model.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/ui/city_weather_details_screen.dart';

class CityWeatherDetailsSection extends StatelessWidget {
  final CityWeatherModel item;

  final DayState current;

  const CityWeatherDetailsSection(
      {required this.item, required this.current, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.background.withOpacity(.44),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wind",
                        style: AppTextStyles.h2.copyWith(
                            color: current == DayState.morning
                                ? Colors.grey.shade700
                                : AppColors.background),
                      ),
                      Text(
                        getDirectionFromDegree(
                            item.hourly.windDirection_10m.first.toDouble()),
                        style: AppTextStyles.textStyle1.copyWith(
                            color: current == DayState.morning
                                ? Colors.grey.shade700
                                : AppColors.background),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              item.hourly.windSpeed_10m.first.toString(),
                              style: AppTextStyles.headline.copyWith(
                                  fontSize: 55,
                                  color: current == DayState.morning
                                      ? Colors.grey.shade700
                                      : AppColors.background),
                            ),
                            Text(
                              " km\\h",
                              style: AppTextStyles.headline.copyWith(
                                  fontSize: 25,
                                  color: current == DayState.morning
                                      ? Colors.grey.shade700
                                      : AppColors.background),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.background.withOpacity(.44)),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Rain",
                        style: AppTextStyles.h2.copyWith(
                            color: current == DayState.morning
                                ? Colors.grey.shade700
                                : AppColors.background),
                      ),
                      Image.asset(
                        AppAssets.rainIcon,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              item.hourly.rain.first.toString(),
                              style: AppTextStyles.headline.copyWith(
                                  fontSize: 35,
                                  color: current == DayState.morning
                                      ? Colors.grey.shade700
                                      : AppColors.background),
                            ),
                            Text(
                              " mm",
                              style: AppTextStyles.headline.copyWith(
                                  fontSize: 20,
                                  color: current == DayState.morning
                                      ? Colors.grey.shade700
                                      : AppColors.background),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.background.withOpacity(.44),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "Soil",
                          style: AppTextStyles.h2.copyWith(
                              color: current == DayState.morning
                                  ? Colors.grey.shade700
                                  : AppColors.background),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                item.hourly.soilTemperature0Cm.first.toString(),
                                style: AppTextStyles.headline.copyWith(
                                    fontSize: 25,
                                    color: current == DayState.morning
                                        ? Colors.grey.shade700
                                        : AppColors.background),
                              ),
                              Text(
                                " °C",
                                style: AppTextStyles.headline.copyWith(
                                    fontSize: 15,
                                    color: current == DayState.morning
                                        ? Colors.grey.shade700
                                        : AppColors.background),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.background.withOpacity(.44),
              ),
                  padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "Snow",
                            style: AppTextStyles.h2.copyWith(
                                color: current == DayState.morning
                                    ? Colors.grey.shade700
                                    : AppColors.background),
                          ),
                          Image.asset(
                            AppAssets.snowIcon,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  item.hourly.snowfall.first.toString(),
                                  style: AppTextStyles.headline.copyWith(
                                      fontSize: 25,
                                      color: current == DayState.morning
                                          ? Colors.grey.shade700
                                          : AppColors.background),
                                ),
                                Text(
                                  " cm",
                                  style: AppTextStyles.headline.copyWith(
                                      fontSize: 15,
                                      color: current == DayState.morning
                                          ? Colors.grey.shade700
                                          : AppColors.background),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              )),
          StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.background.withOpacity(.44),
              ),
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical:4 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Next 5 days " ,style:  AppTextStyles.h2.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: current == DayState.morning
                            ? Colors.grey.shade700
                            : AppColors.background)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: item.nextDays!.map<String,Widget>((key, value) {
                        return MapEntry(key,Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        Image.asset(getCurrentIcon(current,value.weathercode),width: 30,height: 30,),
                        const SizedBox(height: 10,),
                        Text(value.temperature.toString(), style:  AppTextStyles.headline.copyWith(
                        fontSize: 25,
                        color: current == DayState.morning
                        ? Colors.grey.shade700
                            : AppColors.background),
                        ),
                        const SizedBox(height: 10,),
                        Text(formatDate(key), style:  AppTextStyles.h2.copyWith(
                        fontSize: 16,
                        color: current == DayState.morning
                        ? Colors.grey.shade700
                            : AppColors.background),
                        ),

                        ],
                        ),
                        ));

                      }).values.toList(),
                      ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat dateFormat = DateFormat('d MMM');
    return dateFormat.format(dateTime);
  }
  String getDirectionFromDegree(double degree) {
    if (degree < 0 || degree > 360) {
      return 'Invalid degree';
    }

    if (degree >= 337.5 || degree < 22.5) {
      return 'North';
    } else if (degree >= 22.5 && degree < 67.5) {
      return 'North-East';
    } else if (degree >= 67.5 && degree < 112.5) {
      return 'East';
    } else if (degree >= 112.5 && degree < 157.5) {
      return 'South-East';
    } else {
      return "Un Known";
    }
  }
}
