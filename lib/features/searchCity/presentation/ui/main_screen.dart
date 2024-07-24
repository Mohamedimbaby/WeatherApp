
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather_app/core/assets/app_assets.dart';
import 'package:simple_weather_app/core/colors/app_colors.dart';
import 'package:simple_weather_app/core/dependency_injection/dependency_injection.dart';
import 'package:simple_weather_app/core/textStyles/app_text_styles.dart';
import 'package:simple_weather_app/core/widgets/shimmer.dart';
import 'package:simple_weather_app/features/cityWeatherDetails/presentation/ui/city_weather_details_screen.dart';
import 'package:simple_weather_app/features/searchCity/presentation/cubit/cities_search_state.dart';
import 'package:simple_weather_app/features/searchCity/presentation/cubit/search_cubit.dart';
import 'package:simple_weather_app/features/searchCity/presentation/ui/widgets/search_component.dart';
import 'package:simple_weather_app/features/searchCity/presentation/ui/widgets/wallpaper_view.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen>
    with SingleTickerProviderStateMixin {

  CitiesSearchCubit citiesSearchCubit = getIt<CitiesSearchCubit>();
  final TextEditingController _searchController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesSearchCubit,
        CitiesSearchState>(
        bloc: citiesSearchCubit,
        buildWhen: (prev , curr) => prev.opacity != curr.opacity,
        builder:(ctx , state){
          return Scaffold(
            backgroundColor:  AppColors.background ,
            body: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Background image
                      AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          opacity: state.opacity,
                          child: const WallpaperView()),
                      // Weather information
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SearchComponent(state:state, typeAheadController: _searchController,),
                            Expanded(
                              child: BlocBuilder<CitiesSearchCubit,
                                  CitiesSearchState>(
                                  bloc: citiesSearchCubit,
                                  builder: (context, state) {
                                    if (state is CitiesSearchEmptyState) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(AppAssets.umbrella,fit: BoxFit.cover, height: MediaQuery.of(context).size.height * .15,),
                                            Column(
                                              children: [
                                                Text(
                                                  'Weatherly App',
                                                  style: AppTextStyles.headline.copyWith(
                                                      fontSize: 36
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 20,),
                                                Text(
                                                  'Discover the World, One Forecast at a Time! Search for any city and uncover its weather secrets today!',
                                                  style: AppTextStyles.textStyle1,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            )
                                        ],
                                      );
                                    }
                                    else if (state is CitiesSearchLoadingState) {
                                      return const SkeletonLoader();
                                    } else if (state is CitiesSearchResultState) {
                                      return RefreshIndicator(
                                        onRefresh: ()=> _refresh(),
                                        child: ListView.builder(
                                          itemCount: state.cities.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return InkWell(
                                              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (ctx)=>  CityWeatherDetailsScreen(cityModel: state.cities[index],))),
                                              child: ListTile(
                                                leading: Text(state.cities[index].flag, style: AppTextStyles.headline,),
                                                title: Text(state.cities[index].name, style: AppTextStyles.h2,),
                                                subtitle: Text(state.cities[index].summary,style: AppTextStyles.h3,),
                                                trailing: Text(state.cities[index].temperature,style: AppTextStyles.h2,),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    } else if (state is CitiesSearchErrorState) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.error,
                                            style: AppTextStyles.headline,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const SizedBox();
                                    }
                                  }),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    citiesSearchCubit.autoCompleteCitiesSearch(_searchController.text);
  }

}
