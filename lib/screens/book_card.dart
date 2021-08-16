import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenge_bank_test/data/constatnts.dart';
import 'package:tenge_bank_test/data/model/Card.dart';
import 'package:tenge_bank_test/data/utils/utils.dart';
import 'package:tenge_bank_test/screens/customise_card.dart';
import 'package:tenge_bank_test/widgets/w_cta_button.dart';
import 'package:tenge_bank_test/widgets/w_customeCard.dart';

class BookCard extends StatefulWidget {
  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  final controller = PageController(viewportFraction: 0.8);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Book Card')),
        backgroundColor: MyColors.primaryGreen,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 36,
          ),
          SizedBox(
            height: 180,
            child: PageView(
              controller: controller,
              children: [
                WCustomCard(
                  onTap: (){
                    ConstData.cardType = controller.page!.toInt();
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomiseCard(),
                        ));

                  },
                  backImg: MyIcons.backUz,
                  logo: MyIcons.uzCard,
                ),
                WCustomCard(
                  onTap: (){
                    ConstData.cardType = controller.page!.toInt();
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomiseCard(),
                        ));

                  },
                  backImg: MyIcons.backHumo,
                  logo: MyIcons.humo,
                ),
                WCustomCard(
                  onTap: (){
                    ConstData.cardType = controller.page!.toInt();
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => CustomiseCard(),
                        ));

                  },
                  backImg: MyIcons.backVisa,
                  logo: MyIcons.visa,
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 36, right: 16, left: 16),
              child: Text(
                'Thr card is becoming increasingly popular due to the development of payment services and the Uzcard terminal network',
                style: MyTextStyle.poppinsReg,
              )),

          Spacer(),


          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Text('Custom style'),
                Spacer(),
                CupertinoSwitch(
                    value: ConstData.done,
                    onChanged: (value) {

                        ConstData.cardType = controller.page!.toInt();
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => CustomiseCard(),
                            ));

                    }),
              ],
            ),
          ),

          WCTAButton(
            title: 'Order a card',
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}
