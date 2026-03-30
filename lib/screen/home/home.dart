import 'package:flutter/material.dart';

import 'package:family_time/widgets/bottomnav.dart';

// --- Mock AppColor (Replace with your actual import) ---
class AppColor {
  static const primary = Color(0xFF6C63FF); // Example Purple
  static const secondary = Color(0xFFE0E0E0); // Light Grey
  static const text = Color(0xFF2D2D2D);
}

// --- FULL WORKING HOMESCREEN ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7), // Elegant off-white
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: ConstrainedBox(
                // Ensures the content is at least the height of the screen
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Vertically Centralize
                    crossAxisAlignment: CrossAxisAlignment.center, // Horizontally Centralize
                    children: [
                      const SizedBox(height: 40),

                      // --- LOGO ICON ---
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            )
                          ],
                        ),
                        child: const Icon(
                          Icons.flight_takeoff_rounded,
                          size: 48,
                          color: AppColor.primary,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // --- TITLES ---
                      const Text(
                        'Family Time',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w900,
                          color: AppColor.primary,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const Text(
                        'Play. Laugh. Connect.',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // --- MAIN IMAGE ---
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'assets/img/Family_playing_games.png',
                            height: constraints.maxHeight * 0.3,
                            fit: BoxFit.contain,
                            // Error builder in case the image path is wrong
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image, size: 100, color: Colors.grey),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // --- BUTTONS ---
                      _buildButton(
                        label: 'Get Started',
                        bgColor: AppColor.primary,
                        textColor: Colors.white,
                        icon: Icons.arrow_forward_ios_rounded,
                        onPressed: () => print('Get Started Pressed'),
                      ),
                      const SizedBox(height: 12),
                      _buildButton(
                        label: 'Game History',
                        bgColor: AppColor.secondary,
                        textColor: Colors.black87,
                        icon: Icons.history_rounded,
                        onPressed: () => print('Game History Pressed'),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      
      bottomNavigationBar:  Bottomnav(),
    );
  }

  // Button Builder
  Widget _buildButton({
    required String label,
    required Color bgColor,
    required Color textColor,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 280,
          height: 60,
          child: CustomBtn( // Using the local widget defined below
            label: label,
            color: textColor,
            onPressed: onPressed,
            backgroundColor: bgColor,
            icon: icon,
          ),
        ),
      ),
    );
  }
}


// --- LOCAL CUSTOM BUTTON (In case your import is different) ---
class CustomBtn extends StatelessWidget {
  final String label;
  final Color color;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomBtn({
    super.key,
    required this.label,
    required this.color,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Icon(icon, size: 18),
        ],
      ),
    );
  }
}