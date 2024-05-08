
import 'package:flutter/material.dart';
// Importamos la biblioteca Flutter para widgets y Material Design
import 'package:modooscuro/screens/ThemeProvider.dart';
import 'package:modooscuro/screens/myapp.dart';
import 'package:provider/provider.dart';

import 'package:modooscuro/screens/counter_model.dart';
 // Importamos la biblioteca 'provider' para administrar el estado


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(), // Establece el tema claro como predeterminado
      darkTheme: ThemeData.dark(), // Establece el tema oscuro
      home: const MyHomePage(title: 'I become the true king'),
    );
  }
}