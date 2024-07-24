import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/colors/app_colors.dart';
import 'package:simple_weather_app/core/dependency_injection/dependency_injection.dart';
import 'package:simple_weather_app/features/searchCity/presentation/cubit/cities_search_state.dart';
import 'package:simple_weather_app/features/searchCity/presentation/cubit/search_cubit.dart';
class SearchComponent extends StatefulWidget {
  final CitiesSearchState state ;
  final TextEditingController typeAheadController ;

  const SearchComponent({required this.state,required this.typeAheadController,super.key});

  @override
  State<SearchComponent> createState() => SearchComponentState();
}



class SearchComponentState extends State<SearchComponent> with SingleTickerProviderStateMixin{
  bool _isSearchActive = false;
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  CitiesSearchCubit citiesSearchCubit = getIt<CitiesSearchCubit>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    _widthAnimation =
    Tween<double>(begin: 50.0, end: MediaQuery.of(context).size.width - 16)
        .animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    super.didChangeDependencies();
  }



  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
      if (_isSearchActive) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: _widthAnimation.value,
          margin: const EdgeInsets.symmetric(
              vertical: 32.0, horizontal: 8),
          decoration: _isSearchActive ? BoxDecoration(
              color:widget.state.opacity == 0 ? AppColors.mainColor.withOpacity(.5):Colors.grey[200],
              borderRadius: BorderRadius.circular(16)
          ): BoxDecoration(
              color:widget.state.opacity == 0 ? AppColors.mainColor.withOpacity(.5):Colors.grey[200],
              shape: BoxShape.circle
          ),
          child: Row(
            children: [
              if (_isSearchActive)
                Expanded(
                  child: TextFormField(
                      controller: widget.typeAheadController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),),
                        onFieldSubmitted:
                          (String? keyword) {
                        citiesSearchCubit
                            .autoCompleteCitiesSearch(
                            keyword!);
                      }),
                ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: _toggleSearch,
                  child: Icon(
                    _isSearchActive
                        ? Icons.close
                        : Icons.search,
                    color:widget.state.opacity == 0 ? AppColors.mainColor:AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
