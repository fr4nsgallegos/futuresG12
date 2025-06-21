import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Hola a todos";

  Future<String> getTitleAsinc() {
    return Future.delayed(Duration(seconds: 3), () => "Los inocentes");
  }

  String getTitleSinc() {
    for (int i = 0; i < 10000000000; i++) {}
    return "Los 7 pecados";
  }

  Widget _buildContainer() {
    return Container(
      margin: EdgeInsets.all(24),
      height: 150,
      width: 200,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(fontSize: 50)),
              ElevatedButton(
                onPressed: () {
                  getTitleAsinc().then((valor) {
                    title = valor;
                    setState(() {});
                  });

                  // title = getTitleSinc();
                  // setState(() {});
                },
                child: Text("Obtener título"),
              ),
              _buildContainer(),
              _buildContainer(),
              _buildContainer(),
              _buildContainer(),
              _buildContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
