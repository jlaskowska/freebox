import 'package:flutter/material.dart';
import 'package:freebox/localizations.dart';
import 'package:freebox/widgets/add_freebox_sheet/widgets/add_freebox_sheet.dart';
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
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            //You can control the height of modal bottom sheet effectively with FractionallySizedBox combined with isScrollControlled: true
            isScrollControlled: true,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            context: context,

            builder: (_) => FractionallySizedBox(
              heightFactor: MediaQuery.of(context).size.height < 650 ? 0.8 : 0.65,
              child: AddFreeboxSheet(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        showSelectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.packageVariantClosed,
              color: Theme.of(context).accentColor,
            ),
            label: AppLocalizations.bottomNavigationBarFreeboxes,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.mapSearchOutline,
              color: Theme.of(context).accentColor,
            ),
            label: AppLocalizations.bottomNavigationBarMap,
          ),
        ],
      ),
      body: SafeArea(
        child: screens[selectedIndex],
      ),
    );
  }
}
