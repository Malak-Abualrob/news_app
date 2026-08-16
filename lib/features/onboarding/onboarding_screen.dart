import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) { 
          return  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/onboarding1.png'),
              SizedBox(height: 24),
              Text(
                'Trending News ',
                style: TextStyle(
                  fontSize: 20, 
                  color: Color(0XFF4E4B66),
                  fontWeight: FontWeight.w700,                
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Stay in the loop with the biggest breaking stories in a stunning visual slider. Just swipe to explore what’s trending right now! ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16, 
                  color: Color(0XFF6E7191),
                  fontWeight: FontWeight.w400,                
                ),
              ),
                
            ],
          );
        },
      ),
    );
  }
}