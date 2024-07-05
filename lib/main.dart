import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_track/app.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'assets/.env');

  runApp(const MyApp());
}
