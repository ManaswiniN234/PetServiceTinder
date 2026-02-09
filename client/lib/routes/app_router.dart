import 'package:flutter/material.dart';
import '../features/auth/presentation/auth_page.dart';
import '../features/onboarding/presentation/onboarding_page.dart';
import '../features/profiles/presentation/profiles_page.dart';
import '../features/swipe/presentation/swipe_page.dart';
import '../features/booking/presentation/booking_page.dart';
import '../features/notifications/presentation/notifications_page.dart';

class AppRouter {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case '/profiles':
        return MaterialPageRoute(builder: (_) => const ProfilesPage());
      case '/swipe':
        return MaterialPageRoute(builder: (_) => const SwipePage());
      case '/booking':
        return MaterialPageRoute(builder: (_) => const BookingPage());
      case '/notifications':
        return MaterialPageRoute(builder: (_) => const NotificationsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route for ${settings.name}')),
                ));
    }
  }
}
