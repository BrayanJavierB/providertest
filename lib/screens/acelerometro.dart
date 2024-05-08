import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  AccelerometerEvent? _accelerometerValues;

  @override
  void initState() {
    super.initState();
    _initializeSensor(); // Llama al método para iniciar la suscripción al evento del acelerómetro.
  }

  void _initializeSensor() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = event; // Actualiza los valores del acelerómetro en tiempo real.
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acelerómetro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Acelerómetro:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            _accelerometerValues != null
                ? Column(
                    children: [
                      Text('Valor X: ${_accelerometerValues!.x}'),
                      Text('Valor Y: ${_accelerometerValues!.y}'),
                      Text('Valor Z: ${_accelerometerValues!.z}'),
                    ],
                  )
                : Text('Esperando datos...'),
          ],
        ),
      ),
    );
  }
}
