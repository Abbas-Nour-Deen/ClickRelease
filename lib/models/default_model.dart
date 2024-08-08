class DefaultModel {
  final String name;
  final String number;
  final String text;

  DefaultModel({required this.name, required this.number, required this.text});

  factory DefaultModel.fromJson(Map<String, dynamic> json) {
    return DefaultModel(
        name: json['DefName'], number: json['number'], text: json['text']);
  }
}
