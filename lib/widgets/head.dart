import 'package:family_time/constant/AppColor.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  const CircleIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: Icon(icon, color: AppColor.primary,),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          CircleIcon(icon: Icons.arrow_back, ),
          Text(
            "New Game",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CircleIcon(icon: Icons.help_outline),
        ],
      ),
    );
  }
}