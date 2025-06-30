import 'package:flutter/material.dart';
import 'package:lta_app/constans/colors.dart';
import 'package:lta_app/routes.dart'; // adjust if different

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

  void _handleTap(BuildContext context, int index) {
    if (index == currentIndex) return; // Prevent redundant navigation

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, RouteNames.home);
        break;
      // case 1:
      //   Navigator.pushReplacementNamed(context, AppRoutes.servicesPage);
      //   break;
      // case 2:
      //   Navigator.pushReplacementNamed(context, AppRoutes.activityPage);
      //   break;
      // case 3:
      //   Navigator.pushReplacementNamed(context, AppRoutes.settingsPage);
      //   break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      currentIndex: currentIndex,
      onTap: (index) => _handleTap(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textColor,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Services'),
        BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Activity'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }
}
