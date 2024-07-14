class WeatherIcons {
  static const String _path = 'assets/images/weather-icons';

  static final Map<String, String> _iconMap = {
    '01d': '$_path/01d.svg',
    '01n': '$_path/01n.svg',
    '02d': '$_path/02d.svg',
    '02n': '$_path/02n.svg',
    '03d': '$_path/03d.svg',
    '03n': '$_path/03n.svg',
    '04d': '$_path/04d.svg',
    '04n': '$_path/04n.svg',
    '09d': '$_path/09d.svg',
    '09n': '$_path/09n.svg',
    '10d': '$_path/10d.svg',
    '10n': '$_path/10n.svg',
    '11d': '$_path/11d.svg',
    '11n': '$_path/11n.svg',
    '13d': '$_path/13d.svg',
    '13n': '$_path/13n.svg',
    '50d': '$_path/50d.svg',
    '50n': '$_path/50n.svg',
  };

  static String getIconByName(String name) {
    return _iconMap[name] ?? 'default.svg';
  }
}
