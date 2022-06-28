import 'package:flutter/material.dart';
import 'package:pagos_app/pages/home_page.dart';
import 'package:pagos_app/pages/pago_completo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stripe App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'pagoCompleto': (_) => const PagoCompletoPage(),
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            color: Color(0xff322492),
          ),
          primaryColor: const Color(0xff284879),
          scaffoldBackgroundColor: const Color(0xff21232A)),
    );
  }
}
