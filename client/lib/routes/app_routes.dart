import 'package:flutter/material.dart';
import '../features/auth/presentation/auth_page.dart';
import '../features/onboarding/presentation/onboarding_page.dart';
import '../features/profiles/presentation/profiles_page.dart';
import '../features/swipe/presentation/swipe_page.dart';
import '../features/booking/presentation/booking_page.dart';
import '../features/home/presentation/home_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String swipe = '/swipe';
  static const String booking = '/booking';

  static Map<String, WidgetBuilder> get routes => {
      onboarding: (_) => const OnboardingPage(),
      login: (_) => const AuthPage(),
      home: (_) => const HomePage(),
      profile: (_) => const ProfilesPage(),
      '${profile}/owner': (_) => const OwnerProfileView(),
      '${profile}/provider': (_) => const ProviderProfileView(),
      swipe: (_) => const SwipePage(),
      booking: (_) => const BookingPage(),
      };
}
