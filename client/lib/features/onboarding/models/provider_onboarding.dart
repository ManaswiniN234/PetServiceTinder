class ProviderOnboarding {
  String name;
  String experience;
  String servicesOffered;
  String credentials;
  String priceRange;
  String availableSlots;

  ProviderOnboarding({
    this.name = '',
    this.experience = '',
    this.servicesOffered = '',
    this.credentials = '',
    this.priceRange = '',
    this.availableSlots = '',
  });

  @override
  String toString() {
    return 'ProviderOnboarding(name: $name, experience: $experience, services: $servicesOffered, credentials: $credentials, priceRange: $priceRange, slots: $availableSlots)';
  }
}
