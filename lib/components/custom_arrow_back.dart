import 'package:collage_map_task/helpers/localization.dart';
import 'package:flutter/material.dart';

import 'custom_images.dart';


class ArrowBack extends StatelessWidget{
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppLocale.of(context).locale.countryCode == "ar"? customImageIconSVG(imageName: "right"):
    customImageIconSVG(imageName: "left");
  }

}

// class ArrowBackIos extends StatelessWidget{
//   final Color color;
//   ArrowBackIos({this.color = Colors.white});
//   @override
//   Widget build(BuildContext context) {
//     return AppLocale.of(context).locale.countryCode != "ar"?
//     customImageIconSVG(imageName: "ios-right",color: color):
//     customImageIconSVG(imageName: "ios-left",color: color);
//   }

// }

// class ArrowVertical extends StatelessWidget{
//   final Color color;
//   final bool isDown;
//   ArrowVertical({this.color = Colors.white,this.isDown = false});
//   @override
//   Widget build(BuildContext context) {
//     return !isDown?
//     customImageIconSVG(imageName: "arrow-up16",color: color):
//     customImageIconSVG(imageName: "arrow-down16",color: color);
//   }
// }