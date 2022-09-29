import 'package:collage_map_task/components/custom_snackBar.dart';
import 'package:collage_map_task/helpers/app_colores.dart';
import 'package:collage_map_task/helpers/localization.dart';
import 'package:collage_map_task/helpers/text_styles.dart';
import 'package:collage_map_task/router/navigator.dart';
import 'package:collage_map_task/router/routes.dart';
import 'package:collage_map_task/services/location_map/core/dataExtractor.dart';
import 'package:collage_map_task/services/location_map/models/submition.dart';
import 'package:flutter/material.dart';

import '../models/floor.dart';
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
  List<Floor> map = [
    Floor(
      stands: ["Floor 1", "Floor 2"],
      labs: ["A1", "A2 & A3", "A4"],
      offices: [
        "Benefits Offices",
        "Trea Office",
        "Graduates Affairs",
        "Students Affairs",
        "Graduate Studies Office",
        "IT Office",
      ],
      number: 1,
    ),
    Floor(
      stands: ["Floor 3"],
      labs: [
        "B1 & B2",
        "B3",
        "B4",
        "B5",
      ],
      offices: [
        "Dean's office",
        "Office of the Vice Dean for Community Service and the Environment",
        "Office of the Vice Dean for Education and Student Affairs",
        "Office of the Vice Dean for Graduate Studies",
      ],
      number: 2,
    ),
    Floor(
      stands: ["Floor 4"],
      labs: [
        "C1 & C2",
        "C3",
        "C4",
        "C5",
        "C6 & C7",
      ],
      offices: [
        "Seminar hall",
        "Office of the Head of the Information Technology Department",
        "Office of the Head of the Computer Science Department",
      ],
      number: 3,
    ),
    Floor(
        stands: [],
        labs: ["D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8"],
        offices: [],
        number: 4),
  ];
  List<String> placeTypes = ["Stands", "Labs", "Offices"];
  int getFloor(String data) {
    for (int x = 0; x < map.length; x++) {
      if (map[x].containes(data)) return map[x].number;
    }
    return 0;
  }

  bool get _validate => floor.isNotEmpty || location.isNotEmpty;

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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: FormSelector(
                            label: "The Floor",
                            value: floor,
                            onTap: (value) => setState(() => floor = value),
                            data: List.generate(
                                4, (index) => "Floor ${index + 1}"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: FormSelector(
                            label: "The location you want to go",
                            value: placeType,
                            onTap: (value) => setState(() => placeType = value),
                            data: placeTypes,
                          ),
                        ),
                        if (placeType == "Stands")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FormSelector(
                              label: "The location you want to go",
                              value: location,
                              onTap: (value) =>
                                  setState(() => location = value),
                              data: Extractor.extract(map, LocationType.stands),
                            ),
                          ),
                        if (placeType == "Labs")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FormSelector(
                              label: "The location you want to go",
                              value: location,
                              onTap: (value) =>
                                  setState(() => location = value),
                              data: Extractor.extract(map, LocationType.labs),
                            ),
                          ),
                        if (placeType == "Offices")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FormSelector(
                              label: "The location you want to go",
                              value: location,
                              onTap: (value) => setState(() {
                                location = value;
                              }),
                              data:
                                  Extractor.extract(map, LocationType.offices),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_validate) {
                      SubmitionModel model = SubmitionModel(
                        location: location,
                        floor: getFloor(location),
                        currentFloor: int.parse(floor.substring(6)),
                      );
                      CustomNavigator.push(Routes.mapResult,arguments: model);
                    } else {
                      showSnackBar(
                        notification: AppNotification(
                            radius: 5,
                            message: "Please fill the data",
                            iconName: "warning",
                            backgroundColor: AppColors.warning),
                      );
                    }
                  },
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
                      child: Text(getLang("search"),
                          style: AppTextStyles.w600
                              .copyWith(fontSize: 14, color: Colors.white)),
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
