import 'package:flutter/material.dart';
import 'package:freebox/modules/backend_service/bacend_service.dart';
import 'package:freebox/modules/backend_service/src/models/freebox.dart';
import 'package:freebox/widgets/custom_circular_progress_indicator.dart';
import 'package:provider/provider.dart';

class FreeboxScreen extends StatelessWidget {
  const FreeboxScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(context.watch<IBackendService>().freeboxStream().toString());
    final freebox = context.watch<IBackendService>().freeboxStream().listen(
          (event) => event.map(
            (e) => Freebox(image: e.image, description: e.description, address: e.address),
          ),
        );
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
