import 'package:flutter/material.dart';
import 'package:moto_maintanix/views/home_view/home.dart';
import 'package:moto_maintanix/views/side_menu_view/side_menu_view.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isAnimating = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void toggleAnimation() {
    if (isAnimating) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
    isAnimating = !isAnimating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedBuilder(
                animation: animationController,
                builder: (__, _) {
                  return Opacity(
                    opacity: animationController.value,
                    child: const SideMenuView(),
                  );
                }),
          ),
          AnimatedBuilder(
            animation: animationController,
            builder: (_, __) {
              return Transform.rotate(
                alignment: Alignment.bottomLeft,
                angle: animationController.value * -0.1,
                child: Transform.translate(
                  offset: Offset(
                    MediaQuery.of(context).size.width *
                        0.8 *
                        animationController.value,
                    MediaQuery.of(context).size.height *
                        0.3 *
                        animationController.value,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(-15, 20),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        30 * animationController.value,
                      ),
                      child: Home(
                        toggleAnimation: toggleAnimation,
                        animationController: animationController,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
