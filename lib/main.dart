import 'package:assignment_sajaya/Repository/auth_repoistory.dart';
import 'package:assignment_sajaya/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final crypto = ClsCrypto("\$@J@Y@_3RP\$Y\$T3M");
  final encrypted = crypto.encrypt("CCCC-1111-CCCC-2222-CCCC-3333-CCCC");
  print("Encrypted: $encrypted");
  final decrypted = crypto.decrypt(encrypted);
  print("Decrypted: $decrypted");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen(),
    );
  }
}

