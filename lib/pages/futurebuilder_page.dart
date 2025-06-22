import 'package:flutter/material.dart';

class FuturebuilderPage extends StatelessWidget {
  Future<String> getData() async {
    return Future.delayed(
      Duration(seconds: 3),
      () => "Datos cargados correctamente",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print("-------------------------------------");
                print(("Snapshot: $snapshot"));
                print("Estado de conexión: ${snapshot.connectionState}");
                print("Has error: ${snapshot.hasError}");
                print("Error: ${snapshot.error}");
                print("Has data: ${snapshot.hasData}");
                print("Data: ${snapshot.data}");
                print("-------------------------------------");

                if (snapshot.connectionState == ConnectionState.waiting) {
                  //si todavia estamos esperando el resultado
                  return Text("Cargando.....", style: TextStyle(fontSize: 50));
                } else if (snapshot.hasError) {
                  //si ha ocurrido algun error
                  return Text("Ocurrió un error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  //la data ya cargó correctamente
                  return Text("Datos recibidos: ${snapshot.data}");
                } else {
                  //estado por defecto
                  return Text("Sin datos disponibles");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
