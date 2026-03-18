import 'package:family_time/screen/TaskCard.dart';
import 'package:family_time/screen/widgets/BottomNav.dart';
import 'package:family_time/screen/widgets/Button.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the red debug banner
      title: 'Family Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Opt-in to the latest Material design
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Family Tasks')),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TaskCard(
                  title: 'My Task',
                  leadingIcon: Icons.add_ic_call_sharp,
                  subtitle: 'Today',
                  progress: 0.5,
                  onSkip: () => print('Skipped'),
                  onEnd: () => print('Task ended'),
                  onView: () => print('Task viewed'),
                  onDone: () => print('Task done'),
                ),
              ),
            ),
            Button(label: 'get started', onPressed: ()=> print('btn press'), backgroundColor: Colors.red, icon: Icons.access_time),
            const Bottomnav(), // Add the bottom navigation bar
          ],
        ),
      ),
    );
  }
}