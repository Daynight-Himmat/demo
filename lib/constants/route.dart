import 'package:demo/Auth/auth_packages.dart';

abstract class Routes {
  static removeRoute({required BuildContext context,required Widget widgets}) async => await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => widgets
      ), (route)=> false
  );

  static pushRoute({required BuildContext context,required Widget widgets}) async => await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => widgets
      )
  );
}