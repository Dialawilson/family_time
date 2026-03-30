import 'package:flutter/material.dart';
// --- FIXED BOTTOMNAV WIDGET ---
class Bottomnav extends StatelessWidget {
  const Bottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F7),
      height: 90, // Enough height to prevent overflow
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 206, 46, 46), // Your specific red
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.diversity_1), label: 'Family'),
              BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Winner'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}