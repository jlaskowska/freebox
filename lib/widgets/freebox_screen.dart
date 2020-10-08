import 'package:flutter/material.dart';
import 'package:freebox/modules/backend_service/bacend_service.dart';
import 'package:freebox/modules/backend_service/src/models/freebox.dart';
import 'package:provider/provider.dart';

class FreeboxScreen extends StatelessWidget {
  const FreeboxScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.watch<IBackendService>().freeboxStream(),
        builder: (context, AsyncSnapshot<List<Freebox>> snapshot) {
          print(snapshot.connectionState);
          if (snapshot.data != null) {
            return ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(snapshot.data[index].description),
              ),
              itemCount: snapshot.data.length,
            );
          } else {
            return Container();
          }
        });
  }
}
