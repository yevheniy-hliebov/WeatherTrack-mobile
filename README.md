# WeatherTrack - mobile version

WeatherTrack - mobile version is a mobile application that I developed to expand my portfolio and highlight my mobile development skills. The project emphasizes my proficiency in technologies such as Flutter, using packages and API integration through sample requests. The core aim of the project is to create a valuable user experience by providing real-time weather information for cities.  

## Features

### API Integration

The project demonstrates my adeptness in working with APIs by integrating two distinct APIs:

- **GeoDB Cities API:** This API enables users to search for cities with populations exceeding 500,000, adding depth to the application's city selection feature.
- **OpenWeatherMap API:** By leveraging this API, the project retrieves real-time weather data based on the selected city's coordinates (latitude and longitude).

### Dynamic Weather Display

Upon selecting a city, the application dynamically retrieves and presents weather data, including:

- Current weather conditions
- Temperature
- Feels-like temperature
- Other pertinent information

The website is designed to be both visually appealing and informative.

### Hourly Weather Forecast

WeatherTrack offers users an hourly weather forecast, empowering them to plan their activities efficiently. The forecast provides essential data, such as time, temperature and weather conditions.

### Weather Details

The application offers an in-depth view of weather conditions by providing additional information:

- Cloud cover percentage
- Humidity levels
- Wind speed and direction
- Atmospheric pressure
- Rain <i>(where available)</i>

These details collectively contribute to a comprehensive understanding of the selected city's weather.

## Purpose

WeatherTrack serves as a valuable tool for users to access real-time weather information for cities, enabling them to make informed decisions and plan activities based on accurate weather forecasts. Beyond showcasing my mastery of mobile development with Flutter, this project underscores my ability to integrate APIs, manage dynamic data, and create meaningful user interactions.

Feel free to explore the project and experience the seamless integration of technology and user-centric design.

## Packages used
- flutter_dotenv
- http
- provider
- flutter_svg
- intl
- url_launcher

## Usage

These instructions will help you set up the project on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following software installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- A device (physical or emulator) for running the app

### Installing
A step by step series of examples that tell you how to get a development environment running:

1. Clone the repo
2. Open the project in your preferred IDE
3. Dublicate `.env.example` and rename to `.env`, write your keys
4. Run `flutter pub get`
5. Run the app (`flutter run`)

### Other commands
- `dart format [path]` - format code to Dart style
- `flutter analyze` - analyze the code for potential issues
- `flutter build apk` - build an APK file for installing on devices

## Documentaions

- [Flutter](https://flutter.dev/) - The framework used
- [Dart](https://dart.dev/) - The language used