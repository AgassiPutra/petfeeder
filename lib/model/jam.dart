class Feeder {
  final int id;
  final String jam;

  Feeder({
    required this.id,
    required this.jam,
  });

  factory Feeder.fromJson(Map<String, dynamic> json) {
    return Feeder(
      id: json['id'],
      jam: json['jam'],
    );
  }

  Map<String, dynamic> toJson() => {
        'jam': jam,
      };
}
