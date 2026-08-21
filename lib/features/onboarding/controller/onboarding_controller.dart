import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier{
  final PageController pageController = PageController();
  int currentIndex = 0;


  void onPageChanged(int index){
    currentIndex = index;
    notifyListeners();
  }

  void onPageChange(int index) {}

}