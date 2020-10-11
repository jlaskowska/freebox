import 'package:flutter/material.dart';
import 'package:freebox/localizations.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AddFreeboxSheet extends StatefulWidget {
  AddFreeboxSheet({Key key}) : super(key: key);

  @override
  _AddFreeboxSheetState createState() => _AddFreeboxSheetState();
}

class _AddFreeboxSheetState extends State<AddFreeboxSheet> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              MdiIcons.cameraEnhanceOutline,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            cursorColor: Theme.of(context).primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            cursorColor: Theme.of(context).primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16,
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.addFreeboxSheetUploadFreeboxButtonLabel,
            ),
          ),
        ),
      ],
    );
  }
}
