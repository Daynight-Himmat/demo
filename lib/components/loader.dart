import 'package:flutter/material.dart';

import '../Constants/color.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 100,
        color: ColorConstants.primaryWhite,
        shadowColor: ColorConstants.primaryWhite,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              color: ColorConstants.primaryWhite,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: ColorConstants.primaryBlack.withOpacity(1),
                  ),
                ))),
      ),
    );
  }
}
