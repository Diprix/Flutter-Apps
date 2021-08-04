import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_management/pages/home.dart';
import 'package:team_management/pages/sign_up_view.dart';
import 'package:team_management/services/auth_service.dart';
import 'package:team_management/services/custom_colors.dart';
import 'package:team_management/widgets/provider_widget.dart';



class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App>with WidgetsBindingObserver {
  var colors = CustomColors(WidgetsBinding.instance!.window.platformBrightness);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {
      colors = CustomColors(WidgetsBinding.instance!.window.platformBrightness);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      db: FirebaseFirestore.instance,
      colors: colors,
      child: MaterialApp(
        title: 'Team Management',
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            textTheme: TextTheme(bodyText2: GoogleFonts.quicksand(fontSize: 14.0))),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            textTheme: TextTheme(bodyText2: GoogleFonts.bitter(fontSize: 14.0))),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/anonymousSignIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.anonymous),
          '/convertUser': (BuildContext context) => SignUpView(authFormType: AuthFormType.convert),
        },
      ),
    );
  }
}


class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService? auth = Provider.of(context)!.auth;
    return StreamBuilder<String>(
      stream: auth!.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : SignUpView(authFormType: AuthFormType.signIn);
        }
        return Container();
      },
    );
  }
}
