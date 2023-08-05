import 'package:flutter/material.dart';


class TextLabel extends StatelessWidget {
  final String? label;
  const TextLabel({super.key, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(label!, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}
