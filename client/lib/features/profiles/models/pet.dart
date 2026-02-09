class Pet {
  final String id;
  final String name;
  final String breed;
  final int? age;
  final String? medicalNotes;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    this.age,
    this.medicalNotes,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    return Pet(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      breed: json['breed'] as String? ?? '',
      age: json['age'] is int ? json['age'] as int : (json['age'] != null ? int.tryParse('${json['age']}') : null),
      medicalNotes: json['medicalNotes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'breed': breed,
        'age': age,
        'medicalNotes': medicalNotes,
      };
}
