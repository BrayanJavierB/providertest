import 'package:flutter/material.dart';
import 'package:modooscuro/screens/acelerometro.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart'; // Importa el archivo donde se define CounterModel
 // Importa la clase SensorScreen

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda pantalla"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Se mantiene el contador',
            ),
            Consumer<CounterModel>(
              builder: (context, model, child) {
                return Text(
                  'Contador: ${model.counter}',
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar a la clase SensorScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SensorScreen()),
                );
              },
              child: Text('Ir a SensorScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
