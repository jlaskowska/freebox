import 'package:flutter/material.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/configs/asset_paths.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/modules/onboarding/widgets/onboarding_page_one.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.rosa,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return PageView(
              children: [
                OnboardingPage(
                  constraints: constraints,
                  assetPath: AssetPaths.onboardingImagePageOne,
                  text: AppLocalizations.onboardingWelcomeHeadline,
                ),
                OnboardingPage(
                  constraints: constraints,
                  assetPath: AssetPaths.onboardingImagePageTwo,
                  text: AppLocalizations.onboardingWelcomeHeadline,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
