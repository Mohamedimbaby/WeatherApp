import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:simple_weather_app/core/dependency_injection/dependency_injection.dart';


import 'package:simple_weather_app/features/searchCity/presentation/ui/main_screen.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Search App',
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}

class CitySearchScreen extends StatefulWidget {
  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final TextEditingController _typeAheadController = TextEditingController();
  String _selectedCity = '';
  double _latitude = 0.0;
  double _longitude = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Search App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TypeAheadField<String>(
          controller: _typeAheadController,
              suggestionsCallback: (String keyword){
             //  return _getCitySuggestions(keyword);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
               onSelected: (String suggestion) {
          _typeAheadController.text = suggestion;
      },
            ),
            const SizedBox(height: 20.0),
            if (_selectedCity.isNotEmpty)
              Text(
                'Selected City: $_selectedCity\nLatitude: $_latitude\nLongitude: $_longitude',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
