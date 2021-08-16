
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenge_bank_test/data/constatnts.dart';
import 'package:tenge_bank_test/data/utils/color.dart';
import 'package:tenge_bank_test/data/utils/utils.dart';
import 'package:tenge_bank_test/screens/book_card.dart';
import 'package:tenge_bank_test/widgets/w_cta_button.dart';

class CustomiseCard extends StatefulWidget {

  @override
  _CustomiseCardState createState() => _CustomiseCardState();
}

class _CustomiseCardState extends State<CustomiseCard> {
  final controller = PageController(viewportFraction: 0.8);
  final ImagePicker _picker = ImagePicker();
  File? galleryImage ;


  void getImage (ImageSource source)async{
    final XFile? image = await _picker.pickImage(source: source);
    if(image != null){
      File? cropped = await ImageCropper.cropImage(sourcePath: image.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        maxHeight: 180,
        maxWidth: 300,
      );

      setState(() {
        galleryImage = cropped;
        indexChoosen =-1;
      });

    }
  }

  int indexChoosen = -1;


  List<String> linksBackCard = [
    'https://www.cardrates.com/images/themes/cr-mobile/images/home/home-hero.jpg?width=538&height=322',
    'https://wallpaperaccess.com/full/3644738.jpg',
    'https://i.pinimg.com/originals/4d/48/f4/4d48f4fd953e913b7bedcd03662db121.jpg',
    'https://previews.123rf.com/images/davidarts/davidarts0905/davidarts090500220/4896701-abstract-design-business-card-background.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a picture'),
        backgroundColor: MyColors.primaryGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 88,
            child: CustomScrollView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    GestureDetector(
                      onTap:() async {
                      getImage(ImageSource.gallery);
                      },
                      child: Container(
                          width: 120,
                          margin: EdgeInsets.only(left: 4, right: 4),
                          alignment: Alignment.centerLeft,
                          child: Center(
                            child:   SvgPicture.asset(
                              MyIcons.camera,
                              height: 24,
                              width: 24,
                              color: MyColors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MyColors.primaryGreen,
                            // image: DecorationImage(image: AssetImage(MyIcons.backUz),fit: BoxFit.fill)
                          )),
                    ),
                    ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: linksBackCard.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              indexChoosen = index;
                              galleryImage = null;
                            });

                          },
                          child: Container(
                              width: 120,
                              margin: EdgeInsets.only(left: 4, right: 4),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(linksBackCard[index]),
                                      fit: BoxFit.fill))),
                        );
                      },
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, left: 16),
            child: Text(
              'Changed card',
              style: MyTextStyle.poppinsBold,
            ),
          ),
          Container(
            height: 180,
            padding: EdgeInsets.only( right: 12,left: 16),
            margin: EdgeInsets.only(right:16,left: 16),
            alignment: Alignment.centerLeft,
            /*decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: ConstData.isNetworkImage ? DecorationImage(image: NetworkImage(ConstData.background),fit: BoxFit.fill)
                    : ConstData.isDef?  DecorationImage(image:  AssetImage(MyIcons.defBack),fit: BoxFit.fill)
                    : DecorationImage(image: FileImage(ConstData.background),fit: BoxFit.fill )),*/
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image:galleryImage !=null?  DecorationImage(image: FileImage(galleryImage!),fit: BoxFit.cover)
                  : indexChoosen ==-1? DecorationImage(image: AssetImage(MyIcons.defBack),fit: BoxFit.fill) : DecorationImage(image: NetworkImage( linksBackCard[indexChoosen]),fit: BoxFit.fill)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Image(image: AssetImage(MyIcons.logo,),height: 80,width: 120,fit: BoxFit.contain,),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Image(image: AssetImage(MyIcons.simCard),height: 48,width: 48,),
              ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Image(image: AssetImage(ConstData.typeOfCard[ConstData.cardType]),height: 44,
                      width: 60,fit: BoxFit.fill,))
            ],),

          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 24),
            child: Text('Dear User, the minimum requirements for image:',style: MyTextStyle.poppinsBold,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 12,bottom: 8),
            child: Text('Image/photo resolution - 2100 x 1344 pixels'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('Image/photo format -JPG, JPEG, PNG'),
          ),
          Spacer(),
          WCTAButton(title: 'Save',onTap: (){
              if(galleryImage == null && indexChoosen != -1){
                ConstData.background = linksBackCard[indexChoosen];
                ConstData.isNetworkImage = true;
                ConstData.isDef = false;
              }else if(galleryImage != null){
                ConstData.background = galleryImage;
                ConstData.isNetworkImage = false;
                ConstData.isDef = false;
              }
              else if(galleryImage == null && indexChoosen == -1) {
                ConstData.isNetworkImage = false;
                ConstData.isDef = true;
                ConstData.background = MyIcons.defBack;
              }
              ConstData.done = true;
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => BookCard(),));


          },),

        ],
      ),
    );
  }
}
