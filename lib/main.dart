import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itcareerscoach/authentication_provider.dart';
import 'package:itcareerscoach/home.dart';
import 'package:itcareerscoach/login.dart';
import 'package:itcareerscoach/model/profile.dart';
import 'package:itcareerscoach/notifier/profile_notifier.dart';
import 'package:provider/provider.dart';
import 'authentication_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationProvider>(
          create: (_) => AuthenticationProvider(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationProvider>().authState,
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileNotifier(),
        ),
        // Added New stream for the Profile documnet access

      ],
      child: MaterialApp(
        title: 'Firebase Authentication',
        debugShowCheckedModeBanner: false,
        home: Authenticate(),
      ),
    );
  }
}

class Authenticate extends StatelessWidget {
  Profile _currentProfile;
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return Home();
    }
    // return LogInPage();

    // add null profile to update profile in letter stages

    // AddProfileAndImage();

    return LoginScreen();

  }
}
