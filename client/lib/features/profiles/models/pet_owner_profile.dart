import 'pet.dart';

class PetOwnerProfile {
  final String id;
  final String name;
  final String? email;
  final String? phone;
  final String? bio;
  final List<Pet> pets;

  PetOwnerProfile({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.bio,
    List<Pet>? pets,
  }) : pets = pets ?? [];

  factory PetOwnerProfile.fromJson(Map<String, dynamic> json) {
    return PetOwnerProfile(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      bio: json['bio'] as String?,
      pets: json['pets'] != null
          ? List<Map<String, dynamic>>.from(json['pets'] as List).map((m) => Pet.fromJson(m)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'bio': bio,
        'pets': pets.map((p) => p.toJson()).toList(),
      };
}
