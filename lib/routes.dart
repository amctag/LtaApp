import 'package:flutter/material.dart';
import 'package:lta_app/screens/home_screen.dart';

// Route names
abstract class RouteNames {
  static const home = '/';
  static const profile = '/profile';
  static const productDetails = '/product/:id'; // Dynamic route
}

// Route generator with arguments
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.profile:
      //   return MaterialPageRoute(builder: (_) => const ProfilePage());
      // case RouteNames.productDetails:
      //   if (args is String) {
      //     return MaterialPageRoute(
      //       builder: (_) => ProductDetailsPage(productId: args),
      //     );
      //   }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found!')),
      ),
    );
  }
}