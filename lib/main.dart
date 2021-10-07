
import 'package:flutter/material.dart';
import 'package:demo/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool _loggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isLoggedIn() {
    return _loggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0
        ),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }

}
