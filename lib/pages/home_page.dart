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
    //usar esto no es correcto porque causa un interrupción en la UI
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

  Future<void> fetchTitle() async {
    getTitleAsinc().then((value) {
      title = value;
      setState(() {});
    });
  }

  @override
  void initState() {
    fetchTitle();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // getTitleAsinc().then((value) {
    //   title = value;
    //   setState(() {});
    // });
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(fontSize: 50)),
              ElevatedButton(
                onPressed: () {
                  title = "Mi planta de naranja Lima";
                  setState(() {});
                },

                // onPressed: () async {
                //   title = await getTitleAsinc();
                //   setState(() {});
                // },
                // onPressed: () {
                //   getTitleAsinc().then((valor) {
                //     title = valor;
                //   });
                //   setState(() {});
                // },
                child: Text("Cambiar el título"),
              ),
              // _buildContainer(),
              // _buildContainer(),
              // _buildContainer(),
              // _buildContainer(),
              // _buildContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
