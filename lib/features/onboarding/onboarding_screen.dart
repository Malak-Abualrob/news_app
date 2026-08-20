import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/models/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: OnboardingModel.onboardingList.length,
        itemBuilder: (BuildContext context, int index) { 
          final OnboardingModel model = OnboardingModel.onboardingList[index];
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      foregroundColor: Color(0XFFC53030),
                    ), 
                    child: Text('Skip',style: TextStyle(fontSize: 16)),
                    
                    )
                  ),
                Image.asset(model.image),
                SizedBox(height: 24),
                Text(
                  model.title,
                  style: TextStyle(
                    fontSize: 20, 
                    color: Color(0XFF4E4B66),
                    fontWeight: FontWeight.w700,                
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  model.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, 
                    color: Color(0XFF6E7191),
                    fontWeight: FontWeight.w400,                
                  ),
                ),
                  
              ],
            ),
          );
        },
      ),
    );
  }
}