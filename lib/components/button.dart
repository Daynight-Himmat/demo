import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/color.dart';

class ButtonFile extends StatelessWidget{

  final buttonName;
  final VoidCallback voidCallback;
  final buttonNode;
  final controller;


  const ButtonFile({super.key,
    this.buttonNode,
    this.buttonName,
    required this.voidCallback,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 48,
        child: MaterialButton(
          onPressed: voidCallback,
          color: ColorConstants.primaryBlack,
          focusNode:buttonNode,
          minWidth: 100,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Text(buttonName, style: const TextStyle(
              fontSize: 14, color: ColorConstants.primaryColor),
          ),
        ),
      ),
    );
  }
}