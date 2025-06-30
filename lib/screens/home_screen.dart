import 'package:flutter/material.dart';
import 'package:lta_app/constans/colors.dart';
import 'package:lta_app/constans/strings.dart';
import 'package:lta_app/routes.dart';
import 'package:lta_app/widgets/appBar.dart';
import 'package:lta_app/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final headerHeight = screenHeight * 0.25; // Quarter of screen height

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: const Text('LTA', style: TextStyle(color: AppColors.primary)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingIcon: IconButton(
          icon: Icon(Icons.menu, color: AppColors.primary),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        endIcon: IconButton(
          icon: Icon(Icons.circle_notifications, color: AppColors.primary),
          onPressed: () {
            /* Handle search */
          },
        ),
      ),
      drawer: CustomDrawer(currentIndex: _selectedIndex),
      body: Column(
        children: [
          // Header image with overlay (top quarter)
          Stack(
            children: [
              Container(
                height: headerHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: headerHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.white.withOpacity(0.8), AppColors.white],
                  ),
                ),
              ),
              Positioned(
                top: kToolbarHeight + 60, // Push text below the AppBar
                left: MediaQuery.of(context).size.width * 0.06,
                right: MediaQuery.of(context).size.width * 0.06,
                child: Text(
                  AppStrings.homeMainText,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w900,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
          ),

          // White content area (rest of screen)
          Expanded(
            child: Container(
              color: AppColors.white,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to the Demo App!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RouteNames.home);
                        },
                        child: const Text('Go to Profile'),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.flutter_dash,
                                size: 50,
                                color: Colors.blue,
                              ),
                              const SizedBox(height: 10),
                              const Text('Flutter Demo App'),
                              const SizedBox(height: 10),
                              FilledButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Button pressed!'),
                                    ),
                                  );
                                },
                                child: const Text('Press Me'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
