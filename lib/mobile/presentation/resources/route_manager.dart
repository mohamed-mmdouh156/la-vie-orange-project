import 'package:flutter/material.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/splash_screen.dart';
import 'string_manager.dart';

class RoutesManager {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
}

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesManager.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  StringManager.undefinedRoute,
                ),
              ),
              body: const Center(
                child: Text(
                  StringManager.undefinedRoute,
                ),
              ),
            ),
    );
  }
}
