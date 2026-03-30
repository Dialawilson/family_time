import 'package:family_time/screen/home/home.dart';
import 'package:flutter/material.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:family_time/screen/TaskCard.dart';
// import 'package:family_time/widgets/button.dart';

void main() => runApp(const MyApp());

// ✅ Modal function


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Family Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      
    );
  }
}

// ✅ Separate HomePage (clean structure)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Family Tasks')),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ✅ TaskCard
            Padding(
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

            // ✅ Custom Button
            // Button(
            //   label: 'Get Started',
            //   onPressed: () => print('btn press'),
            //   backgroundColor: Colors.red,
            //   icon: Icons.access_time,
            // ),

            const SizedBox(height: 20),

            // ✅ Modal Button
            ElevatedButton(
              onPressed: () => print('Open Modal'),
              child: const Text("Open Modal"),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}