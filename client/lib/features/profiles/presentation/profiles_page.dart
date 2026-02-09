import 'package:flutter/material.dart';
import 'package:client/routes/app_routes.dart';

class ProfilesPage extends StatelessWidget {
  const ProfilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profiles')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 12),
                Text('Choose a profile to view', style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 600;
                    final ownerCard = _profileCard(
                      context,
                      title: 'Pet Owner',
                      subtitle: 'View pet owner profile',
                      icon: Icons.pets,
                      route: AppRoutes.profile + '/owner',
                    );

                    final providerCard = _profileCard(
                      context,
                      title: 'Service Provider',
                      subtitle: 'View provider profile',
                      icon: Icons.work,
                      route: AppRoutes.profile + '/provider',
                    );

                    return isWide ? Row(children: [Expanded(child: ownerCard), const SizedBox(width: 12), Expanded(child: providerCard)]) : Column(children: [ownerCard, const SizedBox(height: 12), providerCard]);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileCard(BuildContext context, {required String title, required String subtitle, required IconData icon, required String route}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: Colors.black54),
            const SizedBox(height: 12),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(subtitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, route), child: const Text('View')),
          ],
        ),
      ),
    );
  }
}

