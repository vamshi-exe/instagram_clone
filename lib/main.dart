import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/responsive/mobie_screen_layout.dart';
import 'package:instagram/responsive/responsive_layout_screen.dart';
import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:instagram/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
    await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: 'AIzaSyDKPcx7h_d_kRiG-mcPp_wNV0GOZ6c25iA', 
      appId: '1:957635584669:web:8e5247ada2cd721c2b2a74', 
      messagingSenderId: '957635584669', 
      projectId: 'instagram-28405',
      storageBucket: 'instagram-28405.appspot.com'
      )
    );
  

  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        // 
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot)  {
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
              return const ResponsiveLayout(
           mobileScreenLayout: MobileScreenLayout(), 
            webScreenLayout: WebScreenLayout(),
           );
              }else if(snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'),);
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

