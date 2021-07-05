import 'package:disigns/src/widgets/CardTable.dart';
import 'package:disigns/src/widgets/CustomBottomNavigation.dart';
import 'package:disigns/src/widgets/PageTitle.dart';
import 'package:flutter/material.dart';
import 'package:disigns/src/widgets/Background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          _HomeBody()
        ]
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(),
          CardTable(),
        ],
      ),
    );
  }
}