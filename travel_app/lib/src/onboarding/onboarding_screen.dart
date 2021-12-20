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
    'assets/svg/on_boarding1.svg',
    'assets/svg/on_boarding2.svg',
    'assets/svg/on_boarding3.svg',
  ];
  final Widget svg = new SvgPicture.asset(
    "assets/image.svg",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 80, left: 20, right: 20),
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
                                size: 30),
                            WidgetText(
                                text: 'the world!',
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                size: 30),
                            WidgetText(
                                text: 'the world!',
                                color: Colors.black87,
                                fontWeight: FontWeight.normal,
                                size: 30)
                          ],
                        ),
                        Column(
                          children: List.generate(3, (indexList) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              width: 8,
                              height: index == indexList ? 25 : 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == indexList
                                      ? Colors.red
                                      : Colors.white.withOpacity(0.3)),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 2, child: SvgPicture.asset(images[index]))
              ],
            );
          }),
    );
  }
}
