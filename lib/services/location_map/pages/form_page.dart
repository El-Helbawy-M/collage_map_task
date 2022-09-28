import 'package:collage_map_task/helpers/app_colores.dart';
import 'package:collage_map_task/helpers/localization.dart';
import 'package:collage_map_task/helpers/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_arrow_back.dart';
import '../widgets/form_drop_down_button.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String floor = "";
  String location = "";
  String placeType = "";
  List<String> floors = ["Floor 1", "Floor 2", "Floor 3", "Floor 4"];
  List<String> placeTypes = ["Stands", "Labs", "Offices"];
  List<String> stands = ["stand 1", "stand 2", "stand 3", "stand 4"];
  List<String> labs = [
    "A1",
    "A2 & A3",
    "A4",
    "B1 & B2",
    "B3",
    "B4",
    "B5",
    "C1 & C2",
    "C3",
    "C4",
    "C5",
    "C6 & C7",
    "D1",
    "D2",
    "D3",
    "D4",
    "D5",
    "D6",
    "D7",
    "D8"
  ];
  List<String> offices = [
    "Benefits Offices",
    "Trea Office",
    "Graduates Affairs",
    "Students Affairs",
    "Graduate Studies Office",
    "IT Office",
    "مكتب العميد",
    "مكتب وكيل الكلية لخدمة المجتمع و الببئة",
    "مكتب وكيل الكلية لشؤون التعليم والطلاب",
    "مكتب وكيل الكلية لشؤون الدراسات العليا",
    "قاعة السمنار",
    "مكتب رئيس قسم تكنولجيا العلومات",
    "مكتب رئيس قسم علوم حاسب",
    ""
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(onPressed: (){}, icon: const ArrowBack()),
        backgroundColor: AppColors.mainColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Expanded(
                //   child: SingleChildScrollView(
                //     child: Column(
                //       children: [
                //         const SizedBox(height: 24),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(vertical: 8.0),
                //           child: FormSelector(
                //             label: "The Floor",
                //             value: floor,
                //             onTap: (value) => setState(() => floor = value),
                //             data: floors,
                //           ),
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(vertical: 8.0),
                //           child: FormSelector(
                //             label: "The location you want to go",
                //             value: placeType,
                //             onTap: (value) => setState(() => placeType = value),
                //             data: placeTypes,
                //           ),
                //         ),
                //         if (placeType == "Stands")
                //           Padding(
                //             padding: const EdgeInsets.symmetric(vertical: 8.0),
                //             child: FormSelector(
                //               label: "The location you want to go",
                //               value: location,
                //               onTap: (value) => setState(() => location = value),
                //               data: stands,
                //             ),
                //           ),
                //         if (placeType == "Labs")
                //           Padding(
                //             padding: const EdgeInsets.symmetric(vertical: 8.0),
                //             child: FormSelector(
                //               label: "The location you want to go",
                //               value: location,
                //               onTap: (value) => setState(() => location = value),
                //               data: labs,
                //             ),
                //           ),
                //         if (placeType == "Offices")
                //           Padding(
                //             padding: const EdgeInsets.symmetric(vertical: 8.0),
                //             child: FormSelector(
                //                 label: "The location you want to go",
                //                 value: location,
                //                 onTap: (value) =>
                //                     setState(() => location = value),
                //                 data: offices),
                //           ),
                //       ],
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap:(){},
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(10),
                      // border: value == ""
                      //     ? Border.all(style: BorderStyle.none)
                      //     : Border.all(width: 1, color: Styles.PRIMARY_COLOR),
                    ),
                    child: Center(
                      child: Text(getLang("search"),style: AppTextStyles.w600.copyWith(fontSize: 14,color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
