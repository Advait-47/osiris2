import 'package:flutter/material.dart';
import 'package:ihosiris/screens/main%20tabs/anaylsisgraph.dart';
import 'package:ihosiris/unused/connect1.dart';
import 'package:ihosiris/screens/main%20tabs/profile_pages/profile.dart';
import 'package:ihosiris/widgets/curved_bnb.dart';
import 'package:ihosiris/widgets/custom_bnb.dart';
import 'screens/login pages/login.dart';
import 'screens/main tabs/profile_pages/profile.dart';
import 'screens/main tabs/connect_pages/connect3.dart';
import 'unused/connect2.dart';
import 'unused/connect1.dart';
import 'screens/main tabs/connect_pages/tabs/analysis.dart';
import 'screens/main tabs/profile_pages/support.dart';
import 'screens/login pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // color: Color(0xffEDF2F4),
      // home: GraphPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUp(),
        '/main': (context) => const CurvedBNB(),
        '/analysis': (context) => const AnalysisPage(),
        '/support': (context) => const SupportPage(),
        // '/sec': (context) => const ProfilePage(),
      },
    );
  }
}
