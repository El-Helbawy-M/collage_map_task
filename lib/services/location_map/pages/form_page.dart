import 'package:collage_map_task/components/custom_snackBar.dart';
import 'package:collage_map_task/helpers/app_colores.dart';
import 'package:collage_map_task/helpers/localization.dart';
import 'package:collage_map_task/helpers/text_styles.dart';
import 'package:collage_map_task/router/navigator.dart';
import 'package:collage_map_task/router/routes.dart';
import 'package:collage_map_task/services/location_map/core/dataExtractor.dart';
import 'package:collage_map_task/services/location_map/models/submition.dart';
import 'package:collage_map_task/services/location_map/repo/map_repo.dart';
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
  _clear() {
    floor = "";
    location = "";
    placeType = "";
    setState(() {});
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
                            label: getLang("Your Current Floor"),
                            value: floor,
                            onTap: (value) => setState(() => floor = value),
                            data: List.generate(
                                4, (index) => "Floor ${index + 1}"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: FormSelector(
                            label:
                                "${getLang("Select")} ${getLang("Category")}",
                            value: placeType,
                            onTap: (value) => setState(() => placeType = value),
                            data: MapRepo.placeTypes,
                          ),
                        ),
                        if (placeType == "Stands")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FormSelector(
                              label: "${getLang("Select")} ${getLang("Stand")}",
                              value: location,
                              onTap: (value) =>
                                  setState(() => location = value),
                              data: Extractor.extract(
                                  MapRepo.floors, LocationType.stands),
                            ),
                          ),
                        if (placeType == "Labs")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FormSelector(
                              label: "${getLang("Select")} ${getLang("Lab")}",
                              value: location,
                              onTap: (value) =>
                                  setState(() => location = value),
                              data: Extractor.extract(
                                  MapRepo.floors, LocationType.labs),
                            ),
                          ),
                        if (placeType == "Offices")
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: FormSelector(
                              label:
                                  "${getLang("Select")} ${getLang("Office")}",
                              value: location,
                              onTap: (value) => setState(() {
                                location = value;
                              }),
                              data: Extractor.extract(
                                  MapRepo.floors, LocationType.offices),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (_validate) {
                      SubmitionModel model = SubmitionModel(
                        location: getLang(location),
                        floor: MapRepo.getFloor(location),
                        image: location,
                        currentFloor: int.parse(floor.substring(6)),
                      );
                      _clear();
                      await CustomNavigator.push(Routes.mapResult,
                          arguments: model);
                    } else if (!_validate) {
                      showSnackBar(
                        notification: AppNotification(
                            radius: 5,
                            message: getLang("Please fill the data"),
                            iconName: "warning",
                            backgroundColor: AppColors.warning),
                      );
                    } else {
                      print('error');
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
