import 'package:flutter/material.dart';
import 'package:tenge_bank_test/data/utils/utils.dart';

class WCTAButton extends StatelessWidget {

  final String title;
  final GestureTapCallback onTap;

  const WCTAButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 16,right: 16,bottom: 36,top: 24),
        padding: EdgeInsets.only(top: 16,bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MyColors.primaryGreen
        ),
        child: Text(title),),
    );
  }
}