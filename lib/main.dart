import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/providers/favortie_provider.dart';
import 'package:flutter_project/screens/cart.dart';

import 'package:flutter_project/screens/favorite.dart';
import 'package:flutter_project/screens/home.dart';
import 'package:flutter_project/screens/profile.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;

  List screens = [Home(), Favorite(), Profile()];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavortieProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Software Shop',
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.exit_to_app, color: Colors.white),
              ),
              Builder(
                builder: (context) {
                  return IconButton(
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cart()),
                        ),

                    icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                  );
                },
              ),
            ],
            backgroundColor: Colors.blue,
          ),
          body: screens[index],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.blue,

            currentIndex: index,
            onTap:
                (val) => {
                  setState(() {
                    index = val;
                  }),
                },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
