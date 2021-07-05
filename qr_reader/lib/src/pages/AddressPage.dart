import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/ScanListProvider.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ((_, int i) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.redAccent),
            onDismissed: (DismissDirection direction) {
              Provider.of<ScanListProvider>(context, listen: false)
                  .deleteScansById(scans[i].id!);
            },
            child: ListTile(
              leading: Icon(Icons.home_max_outlined, color: Theme.of(context).primaryColor),
              title: Text(scans[i].value),
              subtitle: Text('ID: ${scans[i].id}'),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              onTap: () => print('abrir algo...'),
            ),
          )),
    );
  }
}
