import 'package:flutter/material.dart';
import 'package:client/routes/app_routes.dart';
import '../models/owner_onboarding.dart';
import '../models/provider_onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String role = 'owner';

  // Owner controllers
  final _petName = TextEditingController();
  final _breed = TextEditingController();
  final _age = TextEditingController();
  final _medical = TextEditingController();

  // Provider controllers
  final _name = TextEditingController();
  final _experience = TextEditingController();
  final _services = TextEditingController();
  final _credentials = TextEditingController();
  final _priceRange = TextEditingController();
  final _slots = TextEditingController();

  int _currentStep = 0;

  OwnerOnboarding owner = OwnerOnboarding();
  ProviderOnboarding provider = ProviderOnboarding();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map && args['role'] is String) {
      role = args['role'] as String;
    }
  }

  void _onStepContinue() {
    final maxStep = role == 'owner' ? 2 : 4;
    if (_currentStep < maxStep) {
      setState(() => _currentStep++);
    } else {
      _completeOnboarding();
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) setState(() => _currentStep--);
  }

  void _completeOnboarding() {
    if (role == 'owner') {
      owner.petName = _petName.text;
      owner.breed = _breed.text;
      owner.age = _age.text;
      owner.medicalHistory = _medical.text;
      // store locally (in-memory). For now we print it.
      // In a real app we would persist to local storage.
      // ignore: avoid_print
      print(owner.toString());
    } else {
      provider.name = _name.text;
      provider.experience = _experience.text;
      provider.servicesOffered = _services.text;
      provider.credentials = _credentials.text;
      provider.priceRange = _priceRange.text;
      provider.availableSlots = _slots.text;
      // ignore: avoid_print
      print(provider.toString());
    }

    Navigator.pushNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final steps = role == 'owner' ? _ownerSteps() : _providerSteps();

    return Scaffold(
      appBar: AppBar(title: Text(role == 'owner' ? 'Onboarding - Owner' : 'Onboarding - Provider')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              LinearProgressIndicator(value: ( _currentStep + 1) / steps.length,),
              const SizedBox(height: 12),
              Stepper(
                currentStep: _currentStep,
                onStepContinue: _onStepContinue,
                onStepCancel: _onStepCancel,
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: Text(_currentStep == steps.length - 1 ? 'Finish' : 'Next'),
                      ),
                      const SizedBox(width: 12),
                      if (_currentStep > 0)
                        TextButton(onPressed: details.onStepCancel, child: const Text('Back')),
                    ],
                  );
                },
                steps: steps,
                type: StepperType.vertical,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> _ownerSteps() {
    return [
      Step(
        title: const Text('Pet details'),
        content: Column(
          children: [
            TextFormField(controller: _petName, decoration: const InputDecoration(labelText: 'Pet name')),
            const SizedBox(height: 8),
            TextFormField(controller: _breed, decoration: const InputDecoration(labelText: 'Breed')),
            const SizedBox(height: 8),
            TextFormField(controller: _age, decoration: const InputDecoration(labelText: 'Age')),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text('Medical history'),
        content: Column(
          children: [
            TextFormField(
              controller: _medical,
              maxLines: 6,
              decoration: const InputDecoration(labelText: 'Medical history & special notes'),
            ),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: const Text('Review'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pet name: ${_petName.text}'),
            Text('Breed: ${_breed.text}'),
            Text('Age: ${_age.text}'),
            const SizedBox(height: 8),
            Text('Medical: ${_medical.text}'),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
    ];
  }

  List<Step> _providerSteps() {
    return [
      Step(
        title: const Text('Personal'),
        content: Column(
          children: [
            TextFormField(controller: _name, decoration: const InputDecoration(labelText: 'Full name')),
            const SizedBox(height: 8),
            TextFormField(controller: _experience, decoration: const InputDecoration(labelText: 'Experience (years)')),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text('Services offered'),
        content: Column(
          children: [
            TextFormField(controller: _services, decoration: const InputDecoration(labelText: 'Services (comma separated)')),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: const Text('Credentials'),
        content: Column(
          children: [
            TextFormField(controller: _credentials, decoration: const InputDecoration(labelText: 'Credentials / Certifications')),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
      Step(
        title: const Text('Pricing & Availability'),
        content: Column(
          children: [
            TextFormField(controller: _priceRange, decoration: const InputDecoration(labelText: 'Price range (e.g. 20-50)')),
            const SizedBox(height: 8),
            TextFormField(controller: _slots, decoration: const InputDecoration(labelText: 'Available time slots')),
          ],
        ),
        isActive: _currentStep >= 3,
      ),
      Step(
        title: const Text('Review'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${_name.text}'),
            Text('Experience: ${_experience.text}'),
            Text('Services: ${_services.text}'),
            Text('Credentials: ${_credentials.text}'),
            Text('Price range: ${_priceRange.text}'),
            Text('Slots: ${_slots.text}'),
          ],
        ),
        isActive: _currentStep >= 4,
      ),
    ];
  }
}

