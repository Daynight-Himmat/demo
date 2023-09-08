import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int? currentIndex = 0;

  List<Widget> tabs = [
    const HomePage(),
    const OrderPage(),
    const ProfilePage(),
    const OrderPage(),
    const ProfilePage(),
  ];

  TextStyle textStyle = const TextStyle(fontSize:  10, fontWeight: FontWeight.w200);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        textStyle: textStyle,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search),
        title: ("Transaction"),
        textStyle: textStyle,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.design_services, color: ColorConstants.primaryWhite,),
        title: ("My Service"),
        inactiveColorSecondary: ColorConstants.primaryWhite,
        textStyle: textStyle,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.wallet_outlined),
        title: ("Payment"),
        textStyle: textStyle,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Account"),
        textStyle: textStyle,
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  final PersistentTabController _controller =PersistentTabController(initialIndex: 0,);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {

    var select = Theme
        .of(context)
        .bottomNavigationBarTheme
        .selectedItemColor;
    var unSelect =
        Theme
            .of(context)
            .bottomNavigationBarTheme
            .unselectedItemColor;
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: ListView(
          children: [

          ],
        ),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: tabs,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(0),
          colorBehindNavBar: Colors.white,
          adjustScreenBottomPaddingOnCurve: true
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: false,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style16,
        // Choose the nav bar style with this property.
      ),
    );
  }
}
