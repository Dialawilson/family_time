import 'package:family_time/constant/AppColor.dart';
import 'package:family_time/widgets/head.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
    int playerCount = 2; // Default player count
    int selectedGameMode = 0; // Default game mode index

    final List<String> gameModes=[
        "most likely to",
        "Deep Talk",
        "Party Mode",
        "Reaction",
        "Story Builder"
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            const Header(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Who's Playing?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Container(
                width: 200,
                height: 30,
                color: Colors.red,
                child: Row(
                  children: [
                   
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
