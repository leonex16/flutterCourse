import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Card Page'),
        ),
        body: ListView(padding: EdgeInsets.all(10.0), children: [
          cardType1(),
          SizedBox(height: 30.0),
          cardType2(),
          SizedBox(height: 30.0),
          cardType3(),
          SizedBox(height: 30.0),
          cardType4(),

        ]));
  }

  Widget cardType1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('title'),
            subtitle: Text(
                'subtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitle'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cacel'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget cardType2() {
    return Card(
      child: Column(children: [
        FadeInImage(
          placeholder: AssetImage('assets/loader.gif'),
          image: NetworkImage(
              'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 250.0,
          fit: BoxFit.cover,
        ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Text Lorem'))
      ]),
    );
  }

  Widget cardType3() {
    return Card(
      elevation: 10.00,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('title'),
            subtitle: Text(
                'subtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitlesubtitle'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Cacel'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

    Widget cardType4() {
    final Widget card = Container(
      child: Column(children: [
        FadeInImage(
          placeholder: AssetImage('assets/loader.gif'),
          image: NetworkImage(
              'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 250.0,
          fit: BoxFit.cover,
        ),
        Container(padding: EdgeInsets.all(10.0), child: Text('Text Lorem'))
      ]),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.00),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.00,
            spreadRadius: 2.00,
            offset: Offset(2.00, 10.00)
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card,
      )
    );
  }
}
