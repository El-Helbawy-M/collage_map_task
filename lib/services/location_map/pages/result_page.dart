import 'package:collage_map_task/components/custom_arrow_back.dart';
import 'package:collage_map_task/helpers/app_colores.dart';
import 'package:collage_map_task/router/navigator.dart';
import 'package:collage_map_task/services/location_map/models/submition.dart';
import 'package:flutter/material.dart';

import '../../../helpers/localization.dart';
import '../../../helpers/text_styles.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key,required this.model}) : super(key: key);
  final SubmitionModel model;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () =>CustomNavigator.pop(), icon: const ArrowBack()),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      //==================================================
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 300,width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage("assets/images/${model.image}.jpg"),fit: BoxFit.fill),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              const SizedBox(height: 20,),
              Text(
                model.location,
                style: AppTextStyles.w800.copyWith(fontSize: 25,color: AppColors.mainColor),
              ),
              const SizedBox(height: 16),
              Text(
                getLang("Description"),
                style: AppTextStyles.w800.copyWith(
                  fontSize: 18,
                  color: AppColors.hint,
                  fontFamily: "txt",
                ),
              ),
              Text(
                model.description,
                style: AppTextStyles.w700.copyWith(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
