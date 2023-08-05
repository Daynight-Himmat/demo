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

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(5);
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          const TextLabel(label: "Horizontal View",),
          Expanded(
            child: CustomScrollView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              slivers: <Widget>[
                SliverList.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: borderRadius
                          ),
                          child: ClipRRect(
                              borderRadius: borderRadius,
                              child: Image.network(url, fit: BoxFit.cover,)
                          ),
                        )
                    );
                  },
                ),
              ],
            ),
          ),
          Sized.sHeight(10),
          const TextLabel(label: "Vertical View",),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: borderRadius
                          ),
                          child: ClipRRect(
                              borderRadius: borderRadius,
                              child: Image.network(url, fit: BoxFit.cover,)
                          ),
                        )
                    );
                  },
                ),
              ],
            ),
          ),
          const TextLabel(label: "Grid View",),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3
                  ),
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: borderRadius
                          ),
                          child: ClipRRect(
                              borderRadius: borderRadius,
                              child: Image.network(url, fit: BoxFit.cover,)
                          ),
                        )
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       children: [
      //         const TextLabel(label: "Horizontal View",),
      //         SizedBox(
      //           height: 200,
      //           width: SizeConfig.screenWidth,
      //           child: ListView.builder(
      //             itemCount: 100,
      //             scrollDirection: Axis.horizontal,
      //             primary: false,
      //             shrinkWrap: true,
      //             itemBuilder: (BuildContext context, int index) {
      //              return Padding(
      //                padding: const EdgeInsets.all(8.0),
      //                child: Container(
      //                  height: 150,
      //                  width: 150,
      //                  decoration: BoxDecoration(
      //                    color: Colors.red,
      //                    borderRadius: borderRadius
      //                  ),
      //                  child: ClipRRect(
      //                    borderRadius: borderRadius,
      //                    child: Image.network(url, fit: BoxFit.fill,)
      //                  ),
      //                )
      //              );
      //             },
      //
      //           ),
      //         ),
      //         const TextLabel(label: "Vertical View",),
      //         SizedBox(
      //           height: SizeConfig.screenWidth,
      //           width: SizeConfig.screenWidth,
      //           child: ListView.builder(
      //             itemCount: 100,
      //             scrollDirection: Axis.vertical,
      //             primary: false,
      //             shrinkWrap: true,
      //             itemBuilder: (BuildContext context, int index) {
      //               return Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Container(
      //                     decoration: BoxDecoration(
      //                         color: Colors.red,
      //                         borderRadius: borderRadius
      //                     ),
      //                     child: ClipRRect(
      //                         borderRadius: borderRadius,
      //                         child: Image.network(url, fit: BoxFit.fill,)
      //                     ),
      //                   )
      //               );
      //             },
      //
      //           ),
      //         ),
      //         const TextLabel(label: "Grid View",),
      //         SizedBox(
      //           height: SizeConfig.screenWidth,
      //           width: SizeConfig.screenWidth,
      //           child: GridView.builder(
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 3,
      //                 childAspectRatio: 2,
      //                 crossAxisSpacing: 1,
      //                 mainAxisSpacing: 1),
      //             primary: false,
      //             shrinkWrap: true,
      //             itemBuilder: (BuildContext context, int index) {
      //               return Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Container(
      //
      //                     decoration: BoxDecoration(
      //                         color: Colors.red,
      //                         borderRadius: borderRadius
      //                     ),
      //                     child: ClipRRect(
      //                         borderRadius: borderRadius,
      //                         child: Image.network(url, fit: BoxFit.fill,)
      //                     ),
      //                   )
      //               );
      //             },
      //
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
