import 'package:flutter/material.dart';

class BarProgressIndicator extends StatelessWidget {
  const BarProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.lightBlueAccent,
        ),
      ),
    );
  }
}
