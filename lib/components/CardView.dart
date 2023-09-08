import 'package:flutter/material.dart';

import '../Constants/color.dart';

class CardView extends StatelessWidget {
  final String label;
  final String value;
  const CardView({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Expanded(child: Card(
      elevation: 5,
      child: SizedBox(
        height: 140,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(label, style: const TextStyle(
                  fontSize: 20,
                  color: ColorConstants.primaryBlack
              ),),
              Text(value, style: const TextStyle(
                  fontSize: 36,
                  color: ColorConstants.primaryBlack
              ),),
            ],
          ),
        ),
      ),
    ));
  }
}
