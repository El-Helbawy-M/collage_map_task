import 'package:collage_map_task/components/custom_arrow_back.dart';
import 'package:collage_map_task/helpers/app_colores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/text_styles.dart';

class ResultPage extends StatelessWidget {
  final String? floor;
  final String? location;
  final String? placeType ;

  const ResultPage({this.floor, this.location, this.placeType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const ArrowBack()),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      //==================================================
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 300,width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage("assets/images/1.jpg"),fit: BoxFit.fill),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              SizedBox(height: 20,),
              Text(
                "Description",
                style: AppTextStyles.w800.copyWith(
                  fontSize: 30,
                  color: AppColors.mainColor,
                  fontFamily: "txt",
                ),
              ),
              Text(
                "Go to ...",
                style: AppTextStyles.w500.copyWith(
                  fontSize: 20,
                  color: AppColors.placeHolder,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
