import 'package:flutter/material.dart';
import 'package:freebox/configs/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final BoxConstraints constraints;
  final String text;
  final String assetPath;
  const OnboardingPage({
    Key key,
    @required this.constraints,
    @required this.assetPath,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        OnboardingCard(
          assetPath: assetPath,
          constraints: constraints,
        )
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
