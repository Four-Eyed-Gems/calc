import 'package:calc/helper/prov.dart';
import 'package:calc/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Helper>(create: (_) => Helper(),),
      ],
      child: const MaterialApp(
        home: FirstScreen(),
        debugShowCheckedModeBanner: false,
      ),

    );
  }
}

