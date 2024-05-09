import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/ThemeProvider.dart';
import 'screens/myapp.dart';
import 'screens/counter_model.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Fondo Oscura y Blanca'),
    );
  }
}
