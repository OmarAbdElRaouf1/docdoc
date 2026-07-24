import 'package:docdoc/core/di/dependency_injection.dart';
import 'package:docdoc/features/auth/presentation/manager/auth/login_cubit.dart';
import 'package:docdoc/features/auth/presentation/views/login_view.dart';
import 'package:docdoc/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/onBoarding/presentation/views/onboarding_view.dart';
import 'routes.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const Placeholder());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for "${settings.name}"'),
            ),
          ),
        );
    }
  }
}
