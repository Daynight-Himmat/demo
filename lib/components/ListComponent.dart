import 'package:demo/Auth/auth_packages.dart';
import 'package:demo/constants/color.dart';

class ListComponent extends StatelessWidget {
  final String name;
  final String status;
  final String amount;
  final String id;
  const ListComponent({super.key, required this.name, required this.status, required this.amount, required this.id,});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),

      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorConstants.primaryWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: CircleAvatar(
                        child: Image.asset(ImageConstants.food)
                    ),
                  )
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                      style: const TextStyle(fontSize: 16, color: ColorConstants.primaryBlack),),
                    Sized.sHeight(5),
                    Text(id, style: const TextStyle(fontSize: 10, color: ColorConstants.textHintColor))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: CommonFunction.status(s: status),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(6))
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Text(status, style: const TextStyle(
                              fontSize: 12,
                              color: ColorConstants.primaryWhite),),
                        )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4))
                          ),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(' \u{20B9}$amount', style: const TextStyle(
                                fontWeight: FontWeight.w500
                            ),),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
