import 'package:demo/Auth/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'homes/dashboard.dart';
import 'packages/packages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Preference>(
          create: (context) => Preference(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          BuildContext rootContext = context;
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 10,
                backgroundColor: ColorConstants.primaryWhite,
                landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                type: BottomNavigationBarType.fixed,
                enableFeedback: true,
                selectedItemColor: ColorConstants.primaryBlack,
                unselectedItemColor: ColorConstants.primaryBlack.withOpacity(0.5),
              ),

            ),
            home: const Splash(),
          );
        },
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool? isLogIn = false;

  Future<void> getLogs() async {
    try {
      isLogIn =
      await Provider.of<Preference>(context, listen: false).isLoggedIn();
      if (isLogIn == true) {
        Routes.removeRoute(context: context, widgets: Dashboard());
      } else {
        Provider.of<Preference>(context, listen: false).setEmail('');
        Provider.of<Preference>(context, listen: false).setPassword('');
        Provider.of<Preference>(context, listen: false).setUsername('');
        Routes.removeRoute(context: context,  widgets: SignIn());
      }
    }
    catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  @override
  void initState() {
    getLogs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
        )
    );
  }
}

