class CityWeatherResponse {
  final double latitude;
  final double longitude;
  final int elevation;
  final HourlyUnits hourlyUnits;
  final Hourly hourly;

  CityWeatherResponse({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
  });
}

class Hourly {
  final List<String> time;
  final List<double> temperature2M;

  Hourly({
    required this.time,
    required this.temperature2M,
  });

}

class HourlyUnits {
  final String time;
  final String temperature2M;

  HourlyUnits({
    required this.time,
    required this.temperature2M,
  });

}
