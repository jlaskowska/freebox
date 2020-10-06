import 'package:flutter/material.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/configs/asset_paths.dart';
import 'package:freebox/configs/route_names.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/modules/analytics/analytics.dart';
import 'package:freebox/modules/user_settings/i_settingsdatabase.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      setState(() => _pageOffset = _pageController.page);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return PageView(
              controller: _pageController,
              children: [
                OnboardingPage(
                  constraints: constraints,
                  assetPath: AssetPaths.onboardingImagePageOne,
                  headline: AppLocalizations.onboardingWelcomeHeadline,
                  description: AppLocalizations.onboardingPageOneDescription,
                  isPageTwo: false,
                  offset: _pageOffset,
                ),
                OnboardingPage(
                  constraints: constraints,
                  assetPath: AssetPaths.onboardingImagePageTwo,
                  headline: AppLocalizations.onboardingWelcomeHeadline,
                  description: AppLocalizations.onboardingPageTwoDescription,
                  isPageTwo: true,
                  offset: _pageOffset - 1,
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
  final bool isPageTwo;

  const OnboardingPage({
    Key key,
    @required this.constraints,
    @required this.assetPath,
    @required this.offset,
    this.headline,
    this.description,
    this.isPageTwo = false,
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
                  style: Theme.of(context).textTheme.headline1,
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
                  style: Theme.of(context).textTheme.bodyText1,
                )
              : Container(),
        ),
        if (isPageTwo)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: ButtonTheme(
                minWidth: 200,
                child: ElevatedButton(
                  onPressed: () {
                    AnalyticsService.userseenOnboarding();
                    Provider.of<ISettingsDatabase>(
                      context,
                      listen: false,
                    ).userSeenOnboarding = true;
                    Navigator.pushNamed(context, RouteNames.mainScreen);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith(
                      (states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => AppColors.navyBlue,
                    ),
                  ),
                  child: Text(AppLocalizations.onboardingPageTwoButtonLabel,
                      style: TextStyle(
                        color: AppColors.white,
                      )),
                ),
              ),
            ),
          ),
        if (!isPageTwo)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
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
  static const _animationBegin = 0.5;
  static const _animationEnd = 2.0;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.forward();
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation animation = Tween<double>(begin: _animationBegin, end: _animationEnd).animate(_controller);
    return AnimatedBuilder(
      animation: animation,
      child: Icon(
        MdiIcons.gestureSwipeHorizontal,
        size: 70,
        color: Theme.of(context).accentColor,
      ),
      builder: (_, child) => Transform.translate(
        offset: Offset(100 * animation.value, 0),
        child: child,
      ),
    );
  }
}
