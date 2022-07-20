import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> animationCenter;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    animation = Tween<double>(
      begin: 0.6,
      end: 1.2,
    ).animate(controller);
    animationCenter = Tween<double>(
      begin: 1.2,
      end: 0.6,
    ).animate(controller);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        key: const Key('animated_build_key'),
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ScaleTransition(
                filterQuality: FilterQuality.low,
                scale: animation,
                child: Container(
                  height: 12,
                  width: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ScaleTransition(
                scale: animationCenter,
                child: Container(
                  height: 12,
                  width: 12,
                  color: Colors.red[700],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ScaleTransition(
                key: const Key('scale_transition_key'),
                filterQuality: FilterQuality.low,
                scale: animation,
                child: Container(
                  height: 12,
                  width: 12,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              ScaleTransition(
                scale: animationCenter,
                child: Container(
                  height: 12,
                  width: 12,
                  color: Colors.red[700],
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          );
        },
        animation: animation,
      ),
    );
  }
}
