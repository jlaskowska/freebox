import 'package:flutter/material.dart';
import 'package:freebox/configs/app_colors.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/widgets/freebox_screen.dart';
import 'package:freebox/widgets/map_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  static const List<Widget> screens = <Widget>[
    FreeboxScreen(),
    MapScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        showSelectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.packageVariantClosed,
              color: AppColors.blue,
            ),
            title: Text(
              AppLocalizations.bottomNavigationBarFreeboxes,
              style: TextStyle(
                color: AppColors.blue,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.mapSearchOutline,
              color: AppColors.blue,
            ),
            title: Text(
              AppLocalizations.bottomNavigationBarMap,
              style: TextStyle(
                color: AppColors.blue,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: screens[selectedIndex],
      ),
    );
  }
}
