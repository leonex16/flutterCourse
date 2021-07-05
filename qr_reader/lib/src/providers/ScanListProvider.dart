import 'package:flutter/material.dart';
import 'package:qr_reader/src/models/scanModel.dart';
import 'package:qr_reader/src/providers/dbProvider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedSection = 'http';

  void newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);

    newScan.id = id;

    if (this.selectedSection == newScan.type) {
      this.scans.add(newScan);
    }

    notifyListeners();
  }

  void loadAllScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  void loadScansByType(String type) async {
    final scans = await DBProvider.db.getScanByType(type);
    this.scans = [...scans!];
    this.selectedSection = type;
    notifyListeners();
  }

  void deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  void deleteScansById(int id) async {
    await DBProvider.db.deleteScanById(id);
  }
}
