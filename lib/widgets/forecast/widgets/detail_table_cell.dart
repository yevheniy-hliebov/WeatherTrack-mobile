import 'package:flutter/material.dart';

class DetailTableCell extends StatelessWidget {
  final String value;

  const DetailTableCell({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
