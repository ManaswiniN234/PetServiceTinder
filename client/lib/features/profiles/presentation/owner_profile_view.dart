import 'package:flutter/material.dart';
import '../models/pet_owner_profile.dart';
import 'package:client/shared/index.dart';

class OwnerProfileView extends StatelessWidget {
  final PetOwnerProfile? profile;

  const OwnerProfileView({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    final p = profile ?? PetOwnerProfile(id: '1', name: 'Alex', email: 'alex@example.com', phone: '555-1234', bio: 'Loves dogs', pets: []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Owner'),
        actions: [IconButton(onPressed: () {/* UI only */}, icon: const Icon(Icons.edit))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      ProfileAvatar(initials: p.name.isNotEmpty ? p.name[0] : 'U'),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(p.name, style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: 6),
                          Text(p.bio ?? '', style: Theme.of(context).textTheme.bodyMedium),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Contact', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Email: ${p.email ?? '-'}'),
                    Text('Phone: ${p.phone ?? '-'}'),
                  ]),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Pets', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (p.pets.isEmpty) Text('No pets added', style: Theme.of(context).textTheme.bodyMedium) else Column(children: p.pets.map((pet) => ListTile(title: Text(pet.name), subtitle: Text('${pet.breed} • Age: ${pet.age ?? '-'}'))).toList()),
                  ]),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Medical notes', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(p.pets.isNotEmpty ? (p.pets.first.medicalNotes ?? '-') : '-', style: Theme.of(context).textTheme.bodyMedium),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
