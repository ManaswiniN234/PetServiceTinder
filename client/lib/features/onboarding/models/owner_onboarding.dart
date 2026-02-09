class OwnerOnboarding {
  String petName;
  String breed;
  String age;
  String medicalHistory;

  OwnerOnboarding({
    this.petName = '',
    this.breed = '',
    this.age = '',
    this.medicalHistory = '',
  });

  @override
  String toString() {
    return 'OwnerOnboarding(petName: $petName, breed: $breed, age: $age, medicalHistory: $medicalHistory)';
  }
}
