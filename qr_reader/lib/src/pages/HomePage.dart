import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/pages/AddressPage.dart';
import 'package:qr_reader/src/pages/HistoryMapsPage.dart';
import 'package:qr_reader/src/providers/ScanListProvider.dart';
import 'package:qr_reader/src/providers/UiProvider.dart';
import 'package:qr_reader/src/providers/DbProvider.dart';
import 'package:qr_reader/src/widgets/CustomNavigationBar.dart';
import 'package:qr_reader/src/widgets/ScanButton.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('History'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteAllScans();
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScanButton(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return HistoryMapsPage();

      case 1:
        scanListProvider.loadScansByType('http');
        return AddressPage();

      default:
        return HistoryMapsPage();
    }
    ;

    return Container();
  }
}
