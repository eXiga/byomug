class Summary {
  final int cups;
  final int weight;

  Summary({this.cups, this.weight});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(cups: json['cups'] as int, weight: json['weight'] as int);
  }
}
