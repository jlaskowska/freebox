import 'package:flutter/material.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/configs/asset_paths.dart';
import 'package:freebox/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.9);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return PageView(
              controller: pageController,
              children: [
                OnboardingPage(
                  constraints: constraints,
                  assetPath: AssetPaths.onboardingImagePageOne,
                  headline: AppLocalizations.onboardingWelcomeHeadline,
                  description: AppLocalizations.onboardingPageOneDescription,
                  offset: pageOffset,
                ),
                OnboardingPage(
                  constraints: constraints,
                  assetPath: AssetPaths.onboardingImagePageTwo,
                  headline: AppLocalizations.onboardingWelcomeHeadline,
                  offset: pageOffset - 1,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final double offset;
  final BoxConstraints constraints;
  final String headline;
  final String description;
  final String assetPath;
  const OnboardingPage({
    Key key,
    @required this.constraints,
    @required this.assetPath,
    @required this.offset,
    this.headline,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8,
          ),
          child: headline != null
              ? Text(
                  headline,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Container(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8,
          ),
          child: Center(
            child: OnboardingCard(
              assetPath: assetPath,
              constraints: constraints,
              offset: offset,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 8,
          ),
          child: description != null
              ? Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Container(),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AnimatedGestureIcon(),
          ),
        ),
      ],
    );
  }
}

class OnboardingCard extends StatelessWidget {
  final String assetPath;
  final BoxConstraints constraints;
  final double offset;
  const OnboardingCard({
    Key key,
    @required this.assetPath,
    @required this.constraints,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.asset(
          assetPath,
          height: constraints.maxHeight * 0.4,
          width: constraints.maxWidth * 0.7,
          fit: BoxFit.cover,
          alignment: Alignment(-offset.abs(), 1),
        ),
      ),
    );
  }
}

class AnimatedGestureIcon extends StatefulWidget {
  AnimatedGestureIcon({Key key}) : super(key: key);

  @override
  _AnimatedGestureIconState createState() => _AnimatedGestureIconState();
}

class _AnimatedGestureIconState extends State<AnimatedGestureIcon> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double animationBegin = 0.5;
  double animationEnd = 2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    Animation animation = Tween<double>(begin: animationBegin, end: animationEnd).animate(controller);
    return AnimatedBuilder(
      animation: animation,
      child: Icon(
        MdiIcons.gestureSwipeHorizontal,
        size: 50,
        color: AppColors.blue,
      ),
      builder: (_, child) => Transform.translate(
        offset: Offset(100 * animation.value, 0),
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
