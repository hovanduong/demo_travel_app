import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_app/src/home/home_screen.dart';
import 'package:travel_app/src/onboarding/components/widget_text.dart';
import 'package:travel_app/src/resource/model/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  List<OnBoarding> onBoarding = [
    OnBoarding(image: 'assets/svg/5.png', colors: 'FF68e1fd', radix: 18),
    OnBoarding(image: 'assets/svg/6.png', colors: 'FFFEBE96', radix: 19),
    OnBoarding(image: 'assets/svg/5.png', colors: 'FFFEBE96', radix: 18),
  ];
  var curentPage = 0;
  var pageviewController = PageController(
    initialPage: 0,
  );

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    autoNextPage();
  }

  autoNextPage() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (curentPage < onBoarding.length - 1) {
        setState(() {
          curentPage = curentPage + 1;
          if (curentPage == onBoarding.length - 1) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            });
          }
        });
      }
      pageviewController.animateToPage(curentPage,
          duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      // }
    });
  }

  onPageChange(int index) {
    setState(() {
      curentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          onPageChanged: (index) => onPageChange(index),
          controller: pageviewController,
          scrollDirection: Axis.vertical,
          itemCount: onBoarding.length,
          itemBuilder: (_, index) {
            return Container(
              color: Color(0xFF98e2f3),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 75, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              WidgetText(
                                  text: 'Enjoy',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  size: 40),
                              WidgetText(
                                  text: 'the world!',
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal,
                                  size: 40),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 350,
                                child: WidgetText(
                                    text:
                                        'Our travel agents are experts at handcrafting and coordinating complex itnieraries around the world!',
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    size: 20),
                              )
                            ],
                          ),
                          Column(
                            children: List.generate(3, (indexList) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 6,
                                height: index == indexList ? 18 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexList
                                        ? Colors.black
                                        : Colors.white.withOpacity(0.3)),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Image.asset(
                        onBoarding[index].image,
                      ))
                ],
              ),
            );
          }),
    );
  }
}
