import 'package:flutter/material.dart';

class MySlider1 extends StatefulWidget {
  const MySlider1({super.key});

  @override
  State<MySlider1> createState() => _MySlider1State();
}

class _MySlider1State extends State<MySlider1> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2));

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.forward(); // Start the animation once the page is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/banner.png"),
                Image.asset(
                  "assets/images/london_logo.png",
                  scale: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
