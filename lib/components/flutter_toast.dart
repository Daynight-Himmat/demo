import 'package:fluttertoast/fluttertoast.dart';
import '../Constants/color.dart';
class Message{
  static Future? showMessage(String message, ){
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstants.primaryBlack,
        textColor: ColorConstants.primaryWhite,
        webBgColor: "#000000",
        webPosition: "center",
        fontSize: 16.0
    );
  }

  static void printWarning(String text) {
      print('\x1B[36m$text\x1B[0m');
  }
}