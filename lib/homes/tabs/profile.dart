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
      backgroundColor: ColorConstants.primaryWhite,
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryWhite,
        title: const Text('Profile Page'),
      ),
      body: Container(
          child: Center(
              child: Text('Profile')
          )
      ),
    );
  }
}