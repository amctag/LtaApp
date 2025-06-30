import 'package:flutter/material.dart';
import 'package:lta_app/constans/colors.dart';

class CustomDrawer extends StatelessWidget {
  final int currentIndex;

  const CustomDrawer({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          // Logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
              'assets/images/lta_logo.png', // Replace with actual path
              height: 50,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 24),

          // Section title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'MAIN',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildListTile(context: context, icon: Icons.dashboard, title: "About us", index: 0, route: '/about'),
                _buildListTile(context: context, icon: Icons.bar_chart, title: "Topics", index: 1, route: '/topics'),
                _buildListTile(context: context, icon: Icons.grid_view, title: "Projects", index: 2, route: '/projects'),
                _buildListTile(context: context, icon: Icons.store_mall_directory, title: "News", index: 3, route: '/news'),
                _buildListTile(context: context, icon: Icons.monetization_on_outlined, title: "Volunteers", index: 4, route: '/volunteers'),
                _buildListTile(context: context, icon: Icons.calendar_today, title: "Contact us", index: 5, route: '/contact'),
                _buildListTile(context: context, icon: Icons.call, title: "Support", index: 6, route: '/support'),
              ],
            ),
          ),

          // Exit button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(10),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Exit App",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                ),
                onTap: () => _showLogoutConfirmation(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required int index,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: currentIndex == index ? FontWeight.bold : FontWeight.normal,
          color: Colors.black,
        ),
      ),
      selected: currentIndex == index,
      selectedTileColor: AppColors.primary.withOpacity(0.08),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit App"),
        content: const Text("Are you sure you want to exit the app?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text(
              "Exit",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
