class Cafe {
  final int pk;
  final String name;

  Cafe({this.pk, this.name});

  factory Cafe.fromJson(Map<String, dynamic> json) {
    return Cafe(
      pk: json['pk'],
      name: json['name'],
    );
  }
}
