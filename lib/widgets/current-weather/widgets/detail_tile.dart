import 'package:flutter/material.dart';

class DetailTile extends StatelessWidget {
  final String value, label;

  const DetailTile({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
