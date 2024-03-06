class DonationType {
  String? id;
  String? title;
  String? description;
  int? amount;

  DonationType({
    this.id,
    this.title,
    this.description,
    this.amount,
  });

  @override
  String toString() =>
      'DonationType(title: $title, description: $description, amount: $amount)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'amount': amount,
    };
  }

  factory DonationType.fromMap(Map<String, dynamic> map) {
    return DonationType(
      id: map['_id'] != null ? map['_id'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] as String,
      amount: map['amount'] != null ? map['amount'] as int : null,
    );
  }
}
