import 'package:flutter/material.dart';
import '../Constants/color.dart';

class AuthButton extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback callBack;
  const AuthButton({super.key, required this.message, required this.buttonText, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            top: 0,
            right: 0,
          ),
          child: Text(
            message,
            style: const TextStyle(
                color: ColorConstants.primaryBlack,
                fontSize: 12,
                fontWeight: FontWeight.w300),
          ),
        ),
        //SizedBox(width: 5,),
        GestureDetector(
          onTap: callBack,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, top: 0, right: 15),
            child: Text(
              buttonText,
              style: const TextStyle(
                  color: ColorConstants.primaryBlack,
                  fontSize: 13,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }
}
