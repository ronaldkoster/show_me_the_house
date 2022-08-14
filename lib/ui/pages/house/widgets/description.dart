import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String _description;
  const Description({Key? key, required String description})
      : _description = description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Omschrijving",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8.0,
        ),
        ExpandableText(
          _description,
          maxLines: 10,
          expandText: "lees de volledige omschrijving",
          collapseText: "toon minder",
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
