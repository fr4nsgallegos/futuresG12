import 'package:flutter/material.dart';

class FuturebuilderPage extends StatelessWidget {
  Future<String> getData() async {
    return Future.delayed(
      Duration(seconds: 3),
      () => "Datos cargados correctamente",
    );
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    return Future.delayed(Duration(seconds: 5), () {
      return [
        {"id": 1, "name": "Zapatos"},
        {"id": 2, "name": "Vetidos"},
        {"id": 3, "name": "Zapatillas"},
        {"id": 4, "name": "Ternos"},
        {"id": 5, "name": "Polos"},
        {"id": 6, "name": "Camisas"},
        {"id": 7, "name": "Correas"},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SEGUNDO EJEMPLO DE FUTURE BUILDER
            FutureBuilder(
              future: getItems(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  List<Map<String, dynamic>> data = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(data[index]["name"]),
                          leading: Text(data[index]["id"].toString()),
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 20,
                    ),
                  );
                }
              },
            ),

            // PRIMER EJEMPLO DE FUTURE BUILDER
            // FutureBuilder(
            //   future: getData(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     print("-------------------------------------");
            //     print(("Snapshot: $snapshot"));
            //     print("Estado de conexión: ${snapshot.connectionState}");
            //     print("Has error: ${snapshot.hasError}");
            //     print("Error: ${snapshot.error}");
            //     print("Has data: ${snapshot.hasData}");
            //     print("Data: ${snapshot.data}");
            //     print("-------------------------------------");

            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       //si todavia estamos esperando el resultado
            //       return Text("Cargando.....", style: TextStyle(fontSize: 50));
            //     } else if (snapshot.hasError) {
            //       //si ha ocurrido algun error
            //       return Text("Ocurrió un error: ${snapshot.error}");
            //     } else if (snapshot.hasData) {
            //       //la data ya cargó correctamente
            //       return Text("Datos recibidos: ${snapshot.data}");
            //     } else {
            //       //estado por defecto
            //       return Text("Sin datos disponibles");
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
