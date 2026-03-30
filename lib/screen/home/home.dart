import 'package:family_time/constant/AppColor.dart';
import 'package:family_time/widgets/bottomnav.dart';
import 'package:family_time/widgets/button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
            color: const Color.fromARGB(255, 215, 215, 215),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Container(
                    color: Colors.white,
                    
                    height: 100,
                    width: 100,
                    child: Icon(Icons.flight, size: 50, color: AppColor.primary),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Family Time', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: AppColor.primary)),
              Text('Play. Laugh. Connect.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.text)),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: SizedBox(
                  height: 300,
                  width:300,
                  child: Image.asset(  
                    'assets/img/Family_playing_games.png',
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width:250,
                height: 60,
                child: 
                 CustomBtn(label: 'Get Started',color: Colors.white, onPressed: () => print('Get Started Pressed'), backgroundColor: AppColor.primary, icon: Icons.arrow_forward_ios, )),
                 SizedBox(
                  height: 5,
                 ),
                 SizedBox(
                  width: 250,
                  height: 60,
                  child: CustomBtn(label: 'Game History',color: Colors.black, onPressed: () => print('Game History Pressed'), backgroundColor: AppColor.secondary, icon: Icons.restart_alt, ),)
              
          
            ],
          ),
        ),
        bottomNavigationBar: Bottomnav(),
      ),
    );  
  }
}