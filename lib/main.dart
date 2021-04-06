import 'package:firebase_core/firebase_core.dart';
import 'package:flutix/services/services.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    FetchResult result = await AuthServices.signUp(
                        "ian@gmail.com",
                        "random!",
                        "Ian",
                        ["Action", "Sci-fi", "Adventure"],
                        "English");

                    if (result.user == null) {
                      print(result.message);
                    } else {
                      print(result.user.toString());
                    }
                  },
                  child: Text('Sign Up')),
              ElevatedButton(
                  onPressed: () async {
                    FetchResult result = await AuthServices.signIn(
                        "ian@gmail.com",
                        "random!");

                    if (result.user == null) {
                      print(result.message);
                    } else {
                      print(result.user.toString());
                    }
                  },
                  child: Text('Sign In')),
            ],
          ),
        ),
      ),
    );
  }
}
