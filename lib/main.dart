import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_store/screen_view/cart.dart';
import 'navigator/route_name.dart';
import 'navigator/routes.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),
      initialRoute: RouteName.splashscreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
