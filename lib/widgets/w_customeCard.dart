import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenge_bank_test/data/constatnts.dart';
import 'package:tenge_bank_test/data/utils/utils.dart';

class WCustomCard extends StatelessWidget {

  final String backImg;
  final String logo;
  final GestureTapCallback onTap;

  WCustomCard({required this.backImg, required this.logo,required this.onTap}) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        margin: EdgeInsets.only(right: 8),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: ConstData.isNetworkImage ? DecorationImage(image: NetworkImage(ConstData.background),fit: BoxFit.fill)
                : ConstData.isDef?  DecorationImage(image:  AssetImage(MyIcons.defBack),fit: BoxFit.fill)
                : DecorationImage(image: FileImage(ConstData.background),fit: BoxFit.fill )),
     /*   decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(backImg),fit: BoxFit.fill  )),*/
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(MyIcons.logo),
              height: 80,
              width: 120,
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  '****0000 00/00',
                  style: MyTextStyle.poppinsBold.copyWith(color: MyColors.white),
                ),
                Spacer(),
                Image(
                  image: AssetImage(logo),
                  height: 64,
                  width: 80,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
