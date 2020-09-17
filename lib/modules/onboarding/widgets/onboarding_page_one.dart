import 'package:flutter/material.dart';
import 'package:freebox/configs/asset_paths.dart';
import 'package:freebox/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return PageView(
              children: [
                OnboardingPage(
                  constraints: constraints,
                  assetPath: AssetPaths.onboardingImagePageOne,
                  headline: AppLocalizations.onboardingWelcomeHeadline,
                  description: AppLocalizations.onboardingPageOneDescription,
                ),
                OnboardingPage(
                    constraints: constraints,
                    assetPath: AssetPaths.onboardingImagePageTwo,
                    headline: AppLocalizations.onboardingWelcomeHeadline),
              ],
            );
          },
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final BoxConstraints constraints;
  final String headline;
  final String description;
  final String assetPath;
  const OnboardingPage({
    Key key,
    @required this.constraints,
    @required this.assetPath,
    this.headline,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    color: Colors.black,
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
          child: OnboardingCard(
            assetPath: assetPath,
            constraints: constraints,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 8,
          ),
          child: description != null
              ? Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )
              : Container(),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Icon(MdiIcons.gestureSwipeHorizontal, size: 50),
            ),
          ),
        ),
      ],
    );
  }
}

class OnboardingCard extends StatelessWidget {
  final String assetPath;
  final BoxConstraints constraints;
  const OnboardingCard({
    Key key,
    @required this.assetPath,
    @required this.constraints,
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
        ),
      ),
    );
  }
}
