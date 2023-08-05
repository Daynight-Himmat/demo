import 'package.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int? currentIndex = 0;

  final tabs = [
    const HomePage(),
    const OrderPage(),
    const ProfilePage(),
  ];

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
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: tabs[currentIndex!],
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: currentIndex!,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        selectedIconTheme: const IconThemeData(
          color: ColorConstants.primaryColor,
          size: 16,
        ),
        unselectedIconTheme: IconThemeData(
          size: 12,
          color: ColorConstants.primaryColor.withOpacity(0.5),
        ),
        selectedItemColor: select,
        unselectedItemColor: unSelect,
        items:  [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: currentIndex == 0 ? select : unSelect,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag, color: currentIndex == 1 ? select : unSelect,),
              label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: currentIndex == 2 ? select : unSelect,),
              label: 'Profile'),
        ],
      ),
    );
  }
}
