import 'package:flutter/material.dart';

class ServerConnection extends StatefulWidget {
  @override
  _ServerConnectionState createState() => _ServerConnectionState();
}

class _ServerConnectionState extends State<ServerConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("assets/ordinary.jpg"),fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("assets/mashroom_log.png"),fit: BoxFit.cover,
                )),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
