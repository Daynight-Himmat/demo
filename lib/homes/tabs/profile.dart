import 'package:flutter/foundation.dart';

import '../../Auth/sign_in.dart';
import 'packages.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  String? userName;

  Future<void> getUserData() async {
    try {
      final name =
      await Provider.of<Preference>(context, listen: false).getUsername();
      setState(() {
        userName = name;
      });
    }
    catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

  @override
  void initState() {
    setState(() {
      getUserData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        title: const Text('Profile Page'),
      ),
      body: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: ColorConstants.textHintColor,
                    child: Icon(Icons.person),
                  ),
                  title:  Text(userName ?? "", style: const TextStyle(
                      fontSize: 14, color: ColorConstants.primaryBlack),),
                ),
                Sized.sHeight(10),
                ButtonFile(
                    voidCallback: () async {
                      Provider.of<Preference>(context, listen: false).setIsLoggedIn(false);
                      Routes.removeRoute(context: context,  widgets: const SignIn());
                    },
                    buttonName: "Log out",
                )
              ],
            )
        ),
      ),
    );
  }
}