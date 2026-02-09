import 'package:flutter/material.dart';
import '../models/service_provider_profile.dart';
import 'package:client/shared/index.dart';

class ProviderProfileView extends StatelessWidget {
  final ServiceProviderProfile? profile;

  const ProviderProfileView({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    final p = profile ?? ServiceProviderProfile(id: '1', name: 'Sam Services', email: 'sam@services.com', experienceYears: 5, services: [], credentials: ['Cert A'], priceRange: '20-50', availableSlots: ['Mon 9-11']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Provider'),
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
                      ProfileAvatar(initials: p.name.isNotEmpty ? p.name[0] : 'S'),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(p.name, style: Theme.of(context).textTheme.headlineSmall),
                          const SizedBox(height: 6),
                          Text('Experience: ${p.experienceYears ?? '-'} years', style: Theme.of(context).textTheme.bodyMedium),
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
                    Text('Services', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (p.services.isEmpty) Text('No services listed', style: Theme.of(context).textTheme.bodyMedium) else Column(children: p.services.map((s) => ListTile(title: Text(s.title), subtitle: Text(s.description ?? '-'))).toList()),
                  ]),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Credentials', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    if (p.credentials == null || p.credentials!.isEmpty) Text('-', style: Theme.of(context).textTheme.bodyMedium) else Wrap(spacing: 8, children: p.credentials!.map((c) => Chip(label: Text(c))).toList()),
                  ]),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Pricing & Availability', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Price range: ${p.priceRange ?? '-'}'),
                    const SizedBox(height: 8),
                    if (p.availableSlots == null || p.availableSlots!.isEmpty) Text('-', style: Theme.of(context).textTheme.bodyMedium) else Column(children: p.availableSlots!.map((s) => ListTile(title: Text(s))).toList()),
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
