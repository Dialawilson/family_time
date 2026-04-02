import 'package:family_time/screen/home/winner/winner.dart';
import 'package:flutter/material.dart';
import 'package:family_time/constant/AppColor.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int selectedIndex = 0;
  int currentPlayerIndex = 0;
  bool showAnswer = false;

  final String correctAnswer = "Mom"; // 🔥 Example answer

  final List<Map<String, String>> players = [
    {"name": "Mom", "image": "https://i.pravatar.cc/150?img=5"},
    {"name": "Dad", "image": "https://i.pravatar.cc/150?img=3"},
    {"name": "Alex", "image": "https://i.pravatar.cc/150?img=12"},
    {"name": "Jamie", "image": "https://i.pravatar.cc/150?img=15"},
  ];

  void nextPlayer() {
    setState(() {
      showAnswer = false;
      selectedIndex = 0;
      currentPlayerIndex =
          (currentPlayerIndex + 1) % players.length;
    });
  }

  void checkAnswer(bool isCorrectPressed) {
    final selectedName = players[selectedIndex]["name"];

    bool isCorrect = selectedName == correctAnswer;

    setState(() {
      showAnswer = true;
    });

    // Optional: Add scoring logic here
    debugPrint(
        "Player: ${players[currentPlayerIndex]["name"]} | Selected: $selectedName | Correct: $isCorrect");
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayer = players[currentPlayerIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _header(),
              const SizedBox(height: 16),
              _progressBar(),
              const SizedBox(height: 10),

              // 🔥 CURRENT PLAYER TURN
              Text(
                "${currentPlayer["name"]}'s Turn",
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),
              _questionCard(),
              const SizedBox(height: 20),
              _voteSection(),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FinalResultsScreen()));
              }, child: Text("result page")),

              const SizedBox(height: 15),

              // 🔥 ANSWER SECTION
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: showAnswer ? _answerSection() : const SizedBox(),
              ),

              const Spacer(),

              // 🔥 ACTION BUTTONS
              if (!showAnswer) _confirmButtons(),
              if (showAnswer) _nextPlayerButton(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 HEADER
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          color: AppColor.primary,
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Column(
          children: [
            Text(
              "FAMILY TIME",
              style: TextStyle(
                color: AppColor.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Round 2 of 10",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Icon(Icons.settings, color: Colors.purple),
      ],
    );
  }

  // 🔹 PROGRESS BAR
  Widget _progressBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: LinearProgressIndicator(
        value: 0.2,
        minHeight: 8,
        backgroundColor: Colors.purple.shade100,
        valueColor: AlwaysStoppedAnimation(AppColor.primary),
      ),
    );
  }

  // 🔹 QUESTION CARD
  Widget _questionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: Text("“",
                style:
                    TextStyle(fontSize: 40, color: Colors.purpleAccent)),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: Text("”",
                style:
                    TextStyle(fontSize: 40, color: Colors.purpleAccent)),
          ),
          const Center(
            child: Text(
              "Who is most likely\nto become\nfamous ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 VOTE SECTION
  Widget _voteSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CAST YOUR VOTE",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? AppColor.primary
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              NetworkImage(player["image"]!),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        player["name"]!,
                        style: TextStyle(
                          color: isSelected
                              ? AppColor.primary
                              : Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  // 🔥 ANSWER UI
  Widget _answerSection() {
    final selectedName = players[selectedIndex]["name"];
    final isCorrect = selectedName == correctAnswer;

    return Container(
      key: const ValueKey("answer"),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isCorrect
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            isCorrect ? "Correct 🎉" : "Wrong ❌",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isCorrect ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Answer: $correctAnswer",
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  // 🔥 CONFIRM BUTTONS
  Widget _confirmButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () => checkAnswer(false),
            child: const Text("Fail"),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () => checkAnswer(true),
            child: const Text("Correct"),
          ),
        ),
      ],
    );
  }

  // 🔥 NEXT PLAYER BUTTON
  Widget _nextPlayerButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 6,
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: nextPlayer,
        child: const Text(
          "Next Player",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}