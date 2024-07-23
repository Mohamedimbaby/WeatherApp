import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_weather_app/core/colors/app_colors.dart';

class LineChartSample2 extends StatefulWidget {
 final  Map<int,double> temps ;
  const LineChartSample2({super.key,required this.temps});

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    AppColors.mainColor,
    AppColors.mainColor,
  ];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 4.0,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
               mainData(),
            ),
          ),
        ),

      ],
    );
  }



  LineChartData mainData() {
   List<FlSpot> result = widget.temps.map((key, value) => MapEntry<int,FlSpot>(key, FlSpot(key.toDouble(), value))).values.toList();
    return LineChartData(
      gridData: const FlGridData(
        show: false,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval:1,
      ),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles:  AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,
          ),
        ),
        leftTitles:  AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,

          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),

      lineBarsData: [
        LineChartBarData(
          spots: result,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: widget.temps.length.toDouble(),
          isStrokeCapRound: false,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

}