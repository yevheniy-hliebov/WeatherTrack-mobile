class AtmosphericPressure {
  final int current;
  final int seaLevel;
  final int groundLevel;

  AtmosphericPressure({
    required this.current,
    required this.seaLevel,
    required this.groundLevel,
  });

  factory AtmosphericPressure.fromMap(Map<String, dynamic> map) {
    return AtmosphericPressure(
      current: map['pressure'],
      seaLevel: map['sea_level'],
      groundLevel: map['grnd_level'],
    );
  }
}
