import 'package:flutter/material.dart';
import 'package:family_time/constant/AppColor.dart';

class Bottomnav extends StatelessWidget {
  const Bottomnav({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
     color: const Color.fromARGB(255, 215, 215, 215),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.all( Radius.circular(20)),
          child: Container(
        color: const Color.fromARGB(255, 206, 46, 46),
            child: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(0, 238, 164, 164),
              selectedItemColor: AppColor.primary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: const Color.fromARGB(255, 225, 224, 225),
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.deepPurpleAccent,
                  icon: Icon(Icons.diversity_1),
                  label: 'Family',
                ), 
                BottomNavigationBarItem(icon: Icon(Icons.emoji_events), 
                label: 'Winner'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                    
              ]
                    ),
          ),
        ),
      ),
    );
  }
}