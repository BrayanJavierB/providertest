import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:modooscuro/screens/second_route.dart';
import 'ThemeProvider.dart';
import 'counter_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has pulsado el botón tantas veces:',
            ),
            Consumer<CounterModel>(
              builder: (context, model, child) {
                return Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headline6,
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              child: Text('Cambiar fondo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
              child: Text('Segunda pantalla'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CounterModel>(context, listen: false).incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
