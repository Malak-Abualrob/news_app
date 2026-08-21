import 'package:flutter/material.dart';
import 'package:news_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:news_app/features/onboarding/models/onboarding_model.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OnboardingController(),
      builder:(context, child){
        final controller = context.read<OnboardingController>();
        return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFFF5F5F5),
          actions: [
            Consumer<OnboardingController>(
              builder: (BuildContext context, OnboardingController value, Widget? child) { 
                return value.currentIndex ==2 ? SizedBox() : TextButton(
                 onPressed: (){},
                 style: TextButton.styleFrom(
                 foregroundColor: Color(0XFFC53030),
                ), 
                child: Text('Skip',style: TextStyle(fontSize: 16)),
              );
               },
            ),
          ],
        ),
        body: PageView.builder(
          controller: controller.pageController,
          onPageChanged: (int index){
            context.read<OnboardingController>().onPageChanged(index);            
          },
          itemCount: OnboardingModel.onboardingList.length,
          itemBuilder: (BuildContext context, int index) { 
            final OnboardingModel model = OnboardingModel.onboardingList[index];
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                children: [
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
                    Spacer(),               
                    ElevatedButton(onPressed:(){
                      controller.pageController.nextPage(duration: Duration(milliseconds: 30),
                       curve: Curves.easeInOut,
                       );
                    }, 
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width , 52),
                      backgroundColor: Color(0XFFC53030),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text('Next'),
                    ),
                ],
              ),
            );
          },
        ),
      );

      },
    );
  }
}