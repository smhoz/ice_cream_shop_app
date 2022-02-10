import 'package:flutter/material.dart';

class CenterCircularProgress extends StatelessWidget {
  const CenterCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
