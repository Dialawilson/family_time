import 'package:flutter/material.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  int playerCount = 4;
  String selectedVibe = "Most Likely To";

  final List<TextEditingController> controllers = List.generate(
    10,
    (_) => TextEditingController(),
  );

  final List<Map<String, dynamic>> vibes = const [
    {"title": "Most Likely To", "icon": Icons.lightbulb_outline},
    {"title": "Deep Talk", "icon": Icons.favorite_border},
    {"title": "Party Mode", "icon": Icons.celebration},
    {"title": "Reaction", "icon": Icons.flash_on},
    {"title": "Story Builder", "icon": Icons.menu_book},
  ];

  @override
  void initState() {
    super.initState();
    controllers[0].text = "Alex";
    controllers[1].text = "Jordan";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _playersSection(),
                    const SizedBox(height: 24),
                    const Text(
                      "Choose Your Vibe",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _vibeGrid(),
                  ],
                ),
              ),
              _startButton(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        Text(
          "New Game",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Icon(Icons.help_outline_rounded, size: 20),
      ],
    );
  }

  Widget _playersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Who's Playing?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            _counter(),
          ],
        ),
        const SizedBox(height: 12),
        ...List.generate(playerCount, (index) => _playerField(index)),
      ],
    );
  }

  Widget _counter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          _iconButton(Icons.remove, () {
            if (playerCount > 1) setState(() => playerCount--);
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("$playerCount"),
          ),
          _iconButton(Icons.add, () {
            setState(() => playerCount++);
          }),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, size: 18, color: Colors.purple),
      ),
    );
  }

  Widget _playerField(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controllers[index],
        decoration: InputDecoration(
          hintText: "Enter name",
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.person_outline, size: 20),
        ),
      ),
    );
  }

  Widget _vibeGrid() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: vibes.map((vibe) {
        final isSelected = selectedVibe == vibe["title"];
        return GestureDetector(
          onTap: () => setState(() => selectedVibe = vibe["title"]),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: MediaQuery.of(context).size.width / 2 - 22,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelected ? Colors.purple : Colors.transparent,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(vibe["icon"], color: Colors.purple),
                const SizedBox(height: 10),
                Text(
                  vibe["title"],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _startButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Start Playing",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 6),
            Icon(Icons.play_arrow_rounded, size: 18)
          ],
        ),
      ),
    );
  }
}