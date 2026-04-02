import 'package:flutter/material.dart';

class FinalResultsScreen extends StatelessWidget {
  const FinalResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Column(
          children: [
            const HeaderSection(),
            const SizedBox(height: 10),
            const WinnerSection(),
            const SizedBox(height: 20),
            const ScoreboardSection(),
            const Spacer(),
            const ActionButtons(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back, color: Colors.deepPurple),
          ),
          const Text(
            "Final Results",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.share, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
class WinnerSection extends StatelessWidget {
  const WinnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.deepPurple, width: 4),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/avatar1.png"),
              ),
            ),
            Positioned(
              top: -10,
              child: Icon(Icons.emoji_events,
                  color: Colors.amber, size: 30),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "WINNER",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Alex",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(
          "2,450 pts",
          style: TextStyle(color: Colors.deepPurple, fontSize: 16),
        ),
      ],
    );
  }
}
class ScoreboardSection extends StatelessWidget {
  const ScoreboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Scoreboard",
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "4 Players",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(height: 10),

            ScoreTile(
              rank: 2,
              name: "Jordan",
              score: "1,850",
              image: "assets/avatar2.png",
            ),
            ScoreTile(
              rank: 3,
              name: "Casey",
              score: "1,620",
              image: "assets/avatar3.png",
            ),
            ScoreTile(
              rank: 4,
              name: "Riley",
              score: "940",
              image: "assets/avatar4.png",
            ),
          ],
        ),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  final int rank;
  final String name;
  final String score;
  final String image;

  const ScoreTile({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(
            rank.toString(),
            style: const TextStyle(
                color: Colors.deepPurple, fontSize: 16),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            score,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: () {},
            icon: const Icon(Icons.refresh),
            label: const Text("Play Again"),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text("Change Mode"),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.home, color: Colors.deepPurple),
            ),
          ],
        )
      ],
    );
  }
}