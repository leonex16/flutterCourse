import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = ScrollController();
  List<int> _numbersList = List.generate(10, (int index) => ++index);
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final currentPosition = _scrollController.position.pixels;
      final maxScroll = _scrollController.position.maxScrollExtent;

      if (currentPosition >= (maxScroll - 500)) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [_createList(context), _createLoading()],
      ),
    );
  }

  Widget _createList(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _numbersList.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
            placeholder: AssetImage('assets/loader.gif'),
            image: NetworkImage(
                'https://picsum.photos/500/250?image=${_numbersList[index]}'),
            height: 250.00,
            fit: BoxFit.cover,
          );
        });
  }

  void _loadImages() {
    for (var i = 0; i < _numbersList.length; i++) {
      _numbersList[i] = _numbersList[i] + 10;
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    final duration = Duration(seconds: 2);

    setState(() {});

    return Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;

    _loadImages();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 10.00)
        ],
      );
    } else {
      return Container();
    }
  }
}
