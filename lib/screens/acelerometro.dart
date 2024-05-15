import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:camera/camera.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  AccelerometerEvent? _accelerometerValues;
  late CameraController _cameraController;
  late bool _isFlashOn;

  @override
  void initState() {
    super.initState();
    _initializeSensor();
    _initializeCamera();
    _isFlashOn = false;
  }

  void _initializeSensor() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = event;
        if (_accelerometerValues!.x > 8 ||
            _accelerometerValues!.y > 8 ||
            _accelerometerValues!.z > 8) {
          _toggleFlashlight();
        }
      });
    });
  }

  void _initializeCamera() {
    _cameraController = CameraController(
      CameraDescription(
        name: '0',
        lensDirection: CameraLensDirection.back,
        sensorOrientation:
            0, // Puedes ajustar este valor según la orientación del sensor
      ),
      ResolutionPreset.low,
    );
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
    });
  }

  void _toggleFlashlight() {
    if (_isFlashOn) {
      _cameraController.setFlashMode(FlashMode.off);
    } else {
      _cameraController.setFlashMode(FlashMode.torch);
    }
    _isFlashOn = !_isFlashOn;
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

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
