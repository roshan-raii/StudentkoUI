import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_application/presentation/screens/SliderPage/slider_1.dart';
import 'package:student_application/presentation/screens/SliderPage/slider_2.dart';
import 'package:student_application/presentation/screens/SliderPage/slider_3.dart';
import 'package:student_application/presentation/screens/SliderPage/slider_4.dart';

class MySlider extends StatelessWidget {
  final PageController _controller1 = PageController();
  final PageController _controller2 = PageController();
  final Key? key;

  MySlider({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller1,
        scrollDirection: Axis.vertical,
        children: [
          MySlider1(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PageView(
                  controller: _controller2,
                  scrollDirection: Axis.horizontal,
                  children: [
                    MySlider2(),
                    MySlider3(),
                    MySlider4(),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _controller2,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotWidth: 20,
                    dotHeight: 5,
                    dotColor: Colors.grey,
                    activeDotColor: Color.fromARGB(255, 63, 63, 63),
                    spacing: 8),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ],
      ),
    );
  }
}
