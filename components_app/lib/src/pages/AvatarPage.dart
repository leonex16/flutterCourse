import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          CircleAvatar(
            backgroundImage:  NetworkImage('https://img.freepik.com/vector-gratis/plantilla-publicacion-instagram-avatar-masculino-plano_272186-34.jpg?size=626&ext=jpg'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.00),
            child: CircleAvatar(
                child: Text('LE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                backgroundColor: Colors.orange,
              ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/loader.gif'),
          image: NetworkImage('https://img.freepik.com/vector-gratis/plantilla-publicacion-instagram-avatar-masculino-plano_272186-34.jpg?size=626&ext=jpg'),
        )
      ),
    );
  }
}
