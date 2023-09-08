import 'dart:convert';

import 'package:demo/components/CardView.dart';
import 'package:demo/components/ListComponent.dart';
import 'package:demo/components/TabView.dart';
import 'package:demo/homes/tabs/transaction.dart';
import 'package:demo/model/listData.dart';
import 'package:faker/faker.dart';

import 'packages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var faker = Faker();
  String url = "https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2022-03/plant-based-food-mc-220323-02-273c7b.jpg";
  int selectedIndex = 0;

  final tabs = [
    Container(),
    Container(),
  ];

  DateTime dateTime = DateTime.now();

  final fake = Faker();
  List rowData =  [];

  Future<void> getData() async {
    try {
      var parsedData = jsonDecode(RowData.jsonData);
      rowData = parsedData['data'].map((e) => Data.fromJson(e)).toList();
    }
    catch (error) {
      rethrow;
    }
  }

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    getData();
    searchController.addListener(() {
      setState(() {
        if (searchController.text.isEmpty) {
          setState(() {
            getData();
          });
        } else {
          setState(() {
            rowData = rowData.where((element) {
              return element.name
                  .toString()
                  .toLowerCase()
                  .contains(searchController.text.toLowerCase());
            }).toList();
          });
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final borderRadius = BorderRadius.circular(5);
    return Scaffold(

      appBar: AppBar(
          backgroundColor: ColorConstants.primaryWhite,
          leading: IconButton(icon: Icon(Icons.menu), onPressed: () async {
            return await getData();
            // return Scaffold.of(context).openDrawer();
          },)
      ),
      body: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ITTextField(
                  hintText: 'Search By Name',
                  prefixIcon: Icon(Icons.search),
                  controller: searchController,
                ),
              ),
              Sized.sHeight(10),
              const Row(
                children: [
                  CardView(label: 'Total Transaction', value: '\u20B9 2.7 Cr'),
                  CardView(label: 'Total Order', value: '234')
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstants.primaryColor,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(30))),
                  child: FlutterTabs(
                      width: 90,
                      height: 30,
                      labels: const ['Transactions', 'Settlements'],
                      selectedIndex: selectedIndex,
                      borderRadius: 30,
                      isScroll: false,
                      unSelectedTextStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.primaryBlack,
                      ),
                      selectedTextStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.primaryWhite,
                      ),
                      selectedLabelIndex: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      isShadowEnable: true
                  ),
                ),
              ),
              Sized.sHeight(10),
              ListTile(
                title: const Text('Recent Transactions', style: TextStyle(
                    fontSize: 24,
                    color: ColorConstants.primaryBlack
                ),),
                subtitle: const Text('Monday 21s Aug, 2023', style: TextStyle(
                    fontSize: 16,
                    color: ColorConstants.textLightBlack3
                ),),
                trailing: Container(
                  child: TextButton(onPressed: () {},
                    child: const Text('View All', style: TextStyle(
                        fontSize: 17,
                        color: ColorConstants.primaryColor
                    ),),),
                ),
              ),
              tabs[selectedIndex],
              Container(
                height: SizeConfig.screenWidth,
                child: ListView.builder(
                  itemCount: rowData.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var data = rowData[index];
                    return ListComponent(name: data.name!,
                        status: data.status!,
                        amount: data.amount!,
                        id: data.transactionId!);
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}