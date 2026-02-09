import 'service.dart';

class ServiceProviderProfile {
  final String id;
  final String name;
  final String? email;
  final int? experienceYears;
  final List<Service> services;
  final List<String>? credentials;
  final String? priceRange;
  final List<String>? availableSlots;

  ServiceProviderProfile({
    required this.id,
    required this.name,
    this.email,
    this.experienceYears,
    List<Service>? services,
    this.credentials,
    this.priceRange,
    this.availableSlots,
  }) : services = services ?? [];

  factory ServiceProviderProfile.fromJson(Map<String, dynamic> json) {
    return ServiceProviderProfile(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String?,
      experienceYears: json['experienceYears'] is int
          ? json['experienceYears'] as int
          : (json['experienceYears'] != null ? int.tryParse('${json['experienceYears']}') : null),
      services: json['services'] != null
          ? List<Map<String, dynamic>>.from(json['services'] as List).map((m) => Service.fromJson(m)).toList()
          : [],
      credentials: json['credentials'] != null ? List<String>.from(json['credentials'] as List) : null,
      priceRange: json['priceRange'] as String?,
      availableSlots: json['availableSlots'] != null ? List<String>.from(json['availableSlots'] as List) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'experienceYears': experienceYears,
        'services': services.map((s) => s.toJson()).toList(),
        'credentials': credentials,
        'priceRange': priceRange,
        'availableSlots': availableSlots,
      };
}
