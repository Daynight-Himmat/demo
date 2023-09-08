import 'package:demo/Auth/auth_packages.dart';

abstract class CommonFunction {
  static emailValidation({String? email}) {
    return !RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!);
  }

  static status({required String s}) {
    switch(s){
    case 'Paid':
    return ColorConstants.buttonGreenColor;
    case 'Pending':
    return ColorConstants.yellowColors;
    default:
    return ColorConstants.highPriorityColor;
    }
  }
}