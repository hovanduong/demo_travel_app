import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/src/onboarding/components/widget_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List images = [
    'assets/svg/2.svg',
    'assets/svg/2.svg',
    'assets/svg/1.svg',
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
      if (curentPage < images.length - 1) {
        setState(() {
          curentPage = curentPage + 1;
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
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              color: Colors.red,
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  size: 40),
                              WidgetText(
                                  text: 'the world!',
                                  color: Colors.black87,
                                  fontWeight: FontWeight.normal,
                                  size: 40),
                              SizedBox(height: 10),
                              SizedBox(
                                width: 350,
                                child: WidgetText(
                                    text:
                                        'Our travel agents are experts at handcrafting and coordinating complex itnieraries around the world!',
                                    color: Colors.grey,
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
                                        : Colors.grey.withOpacity(0.3)),
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: SvgPicture.asset(
                        images[index],
                      ))
                ],
              ),
            );
          }),
    );
  }
}
