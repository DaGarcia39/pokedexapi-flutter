import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ProgressBarStats extends StatefulWidget {
  ProgressBarStats({
    @required this.nameStatistics,
    @required this.colorStatistics,
    @required this.valueStatistics,
  });

  final String nameStatistics;
  final Color colorStatistics;
  final int valueStatistics;

  @override
  _ProgressBarStatsState createState() => _ProgressBarStatsState();
}

class _ProgressBarStatsState extends State<ProgressBarStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FAProgressBar(
          maxValue: 150,
          currentValue: widget.valueStatistics,
          displayText: widget.nameStatistics,
          backgroundColor: Colors.blueGrey,
          progressColor: widget.colorStatistics,
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
