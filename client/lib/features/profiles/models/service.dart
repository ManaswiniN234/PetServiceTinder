class Service {
  final String id;
  final String title;
  final String? description;
  final String? priceRange;
  final List<String>? tags;

  Service({
    required this.id,
    required this.title,
    this.description,
    this.priceRange,
    this.tags,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      priceRange: json['priceRange'] as String?,
      tags: json['tags'] != null ? List<String>.from(json['tags'] as List) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'priceRange': priceRange,
        'tags': tags,
      };
}
