import 'package:calc/helper/prov.dart';
import 'package:calc/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return /*MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        )*/MultiProvider(
          providers: [
            ChangeNotifierProvider<Helper>(create: (_) => Helper(),),
          ],
          child: MaterialApp(
            home: child,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
      child: const FirstScreen(),
    );
  }
}

class MyAppClass extends StatelessWidget {
  const MyAppClass({Key? key}) : super(key: key);

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


