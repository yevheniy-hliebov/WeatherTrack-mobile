class GeoException implements Exception {
  final String message;

  GeoException(this.message);

  @override
  String toString() => 'GeoException: $message';
}
