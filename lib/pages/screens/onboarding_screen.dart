import 'package:flutter/material.dart';
import 'package:bakingapp/pages/screens/login_screen.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green,
          ),

          //image section
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          bottom: 200,

           child: Center(
            child: Image.asset('assets/images/woman.png',
            height: 300,
            ),
          ),
        ),

         //white container

         Align(
            alignment: Alignment.bottomCenter,
            
            child: Container(
              height: 320,
              width: double.infinity,
        
              decoration: BoxDecoration(
                color: Colors.white,
        
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ), 
        
              child: Padding(padding: EdgeInsets.all(24),
        
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Farm2Table',
             style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              ),
              ),
        
              SizedBox(height: 15,),
        
              Text('Connect directly with farmers and Consumers fresh produce, fair prices and a thriving community', 
              textAlign: TextAlign.center,
        
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              ),
        
              SizedBox(height: 40,
              ),
        
              SizedBox(
                width: 180,
                height: 50,
        
                child: ElevatedButton (
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => LoginScreen()),
                        );
                  },
        
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
        
                  child: Text('Get Started',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  ),
                  ),
              ),
                ], 
              ),
              ),     
            ),
            ),
        ],
        ),
      );
  }
}