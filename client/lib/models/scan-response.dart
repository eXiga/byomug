class ScanResponse {
  final String name;
  final int score;

  ScanResponse({this.name, this.score});

  factory ScanResponse.fromJson(Map<String, dynamic> json) {
    return ScanResponse(
        name: json['name'] as String, score: json['score'] as int);
  }
}
