class Tank {
  final int id;
  final String tankName;
  final int tankSize;
  List<String>? occupants;

  Tank({
    required this.id,
    required this.tankName,
    required this.tankSize,
    this.occupants,
  });
}
