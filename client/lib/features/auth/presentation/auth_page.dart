import 'package:flutter/material.dart';
import 'package:client/routes/app_routes.dart';
import 'package:client/shared/index.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  void _selectRole(BuildContext context, String role) {
    // No auth logic; navigate to onboarding and pass selected role
    Navigator.pushNamed(context, AppRoutes.onboarding, arguments: {'role': role});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Are you a Pet Owner or a Service Provider?',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                LayoutBuilder(builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 480;
                  final children = [
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.pets, size: 48, color: Colors.black54),
                              const SizedBox(height: 12),
                              Text('Pet Owner', style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(height: 8),
                              Text('Find services for your pet', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                              const SizedBox(height: 12),
                              PrimaryButton(
                                label: 'Continue as Owner',
                                onPressed: () => _selectRole(context, 'owner'),
                                icon: const Icon(Icons.arrow_forward, size: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12, height: 12),
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.work, size: 48, color: Colors.black54),
                              const SizedBox(height: 12),
                              Text('Service Provider', style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(height: 8),
                              Text('Offer services and manage bookings', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                              const SizedBox(height: 12),
                              PrimaryButton(
                                label: 'Continue as Provider',
                                onPressed: () => _selectRole(context, 'provider'),
                                icon: const Icon(Icons.arrow_forward, size: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];

                  return isWide
                      ? Row(children: children)
                      : Column(children: children);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

