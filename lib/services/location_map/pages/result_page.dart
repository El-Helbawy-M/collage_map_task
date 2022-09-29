import 'package:collage_map_task/components/custom_arrow_back.dart';
import 'package:collage_map_task/helpers/app_colores.dart';
import 'package:collage_map_task/services/location_map/models/submition.dart';
import 'package:flutter/material.dart';

import '../../../helpers/text_styles.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key,required this.model}) : super(key: key);
  final SubmitionModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const ArrowBack()),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      //==================================================
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Expanded(
            child: Image.asset(
              "name",
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Text(
                  "Description",
                  style: AppTextStyles.w800.copyWith(
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: "txt",
                  ),
                ),
                Text(
                  "Go to ...",
                  style: AppTextStyles.w500.copyWith(
                    fontSize: 12,
                    color: AppColors.placeHolder,
                    
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
