import 'package:demo/Auth/sign_in.dart';
import 'package:demo/constants/theme_constants.dart';
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
            theme: StyleClass.themeData(context),
            debugShowCheckedModeBanner: false,
            home: const Dashboard(),
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

