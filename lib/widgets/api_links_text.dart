import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_track/utils/constants/constants.dart';

class ApiLinksText extends StatelessWidget {
  const ApiLinksText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Link(
          label: 'openweathermap.org',
          url: 'https://openweathermap.org',
        ),
        Link(
          label: 'GeoDB Cities',
          url: 'https://rapidapi.com/wirefreethought/api/geodb-cities',
        ),
      ],
    );
  }
}

class Link extends StatelessWidget {
  final String label, url;

  const Link({
    super.key,
    required this.label,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.xs),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      onTap: () => launchUrl(Uri.parse(url)),
    );
  }
}
