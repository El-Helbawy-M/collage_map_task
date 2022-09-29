import 'package:collage_map_task/helpers/app_colores.dart';
import 'package:flutter/material.dart';

import '../../../helpers/text_styles.dart';

class FormSelector extends StatefulWidget {
  const FormSelector({
    required this.label,
    required this.value,
    required this.onTap,
    required this.data,
    Key? key,
  }) : super(key: key);
  final String? label, value;
  final Function(String) onTap;
  final List<String> data;

  @override
  State<FormSelector> createState() => _FormSelectorState();
}

class _FormSelectorState extends State<FormSelector> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: isExpanded ? 300 : 72,
      decoration: BoxDecoration(
        color: AppColors.fieldBorder,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(style: BorderStyle.none),
        // border: value == ""
        //     ? Border.all(style: BorderStyle.none)
        //     : Border.all(width: 1, color: Styles.PRIMARY_COLOR),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              height: 69,
              decoration: BoxDecoration(
                color: AppColors.fieldBorder,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(style: BorderStyle.none),
                // border: value == ""
                //     ? Border.all(style: BorderStyle.none)
                //     : Border.all(width: 1, color: Styles.PRIMARY_COLOR),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.value != "")
                        Text(widget.label!,
                            style: AppTextStyles.w700.copyWith(
                                fontSize: 10, color: AppColors.placeHolder)),
                      if (widget.value != "") const SizedBox(height: 6),
                      Text(
                        widget.value == "" ? widget.label! : widget.value!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: widget.value == ""
                              ? AppColors.hint
                              : AppColors.mainColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    isExpanded? Icons.arrow_drop_up_sharp:Icons.arrow_drop_down_sharp,
                    size: 30,
                    color: AppColors.hint,
                  )
                ],
              ),
            ),
          ),
          if (isExpanded)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  controller: ScrollController(),
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      const Divider(height: 5),
                      ListTile(
                        title: Text(widget.data[index],style: AppTextStyles.w600.copyWith(fontSize: 12)),
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                          widget.onTap(widget.data[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
