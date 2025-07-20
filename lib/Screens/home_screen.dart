import 'package:flutter/material.dart';
import 'package:smart_recipe_app/SharedComponents/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onActionPressed: () {
            // TODO: Implement action when the icon is pressed
          },
          searchController: TextEditingController(),
          logoAsset: 'assets/logo.png', // Replace with your logo asset path
          actionIcon: Icons.settings_rounded,
        ),
        body: Center(
          child: Text(
            'Welcome to the Home Screen!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
