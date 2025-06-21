import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Hola a todos";

  Future<String> getTitle() {
    return Future.delayed(Duration(seconds: 3), () => "Los inocentes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 50)),
            ElevatedButton(
              onPressed: () {
                getTitle().then((valor) {
                  title = valor;
                  setState(() {});
                });
              },
              child: Text("Obtener título"),
            ),
          ],
        ),
      ),
    );
  }
}
