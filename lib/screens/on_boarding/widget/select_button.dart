import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:mhc_consumer/screens/on_boarding/model/options.dart';

import '../../../controllers/onboarding_controller.dart';
//import '../../../utils/constants.dart';
import '../../../util/constants.dart';
import '../model/options.dart';

class SelectButtons extends GetView<OnBoardingController> {
  final String label;
  final Options value;
  final OptionsType type;

  const SelectButtons(
      {required this.label, required this.type, required this.value});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    bool isSelected = false;

    return Obx(() {
      if (type == OptionsType.allergies) {
        isSelected = controller.allergies.value == value;
      }
      if (type == OptionsType.disease) {
        isSelected = controller.disease.value == value;
      }

      if (type == OptionsType.weight) {
        isSelected = controller.weight.value == value;
      }
      if (type == OptionsType.height) {
        isSelected = controller.height.value == value;
      }
      return GestureDetector(
        onTap: () {
          if (type == OptionsType.allergies) {
            controller.allergies.value = value;
          }
          if (type == OptionsType.disease) {
            controller.disease.value = value;
          }

          if (type == OptionsType.weight) {
            controller.weight.value = value;
          }
          if (type == OptionsType.height) {
            controller.height.value = value;
          }
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(right: 15, top: 10),
          decoration: BoxDecoration(
            color: isSelected ? Constants.pColor : Constants.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$label ',
            style: TextStyle(
              fontSize: 13,
              color: isSelected ? Colors.white : Constants.textColor2,
            ),
          ),
        ),
      );
    });
  }
}

class SelectButtonsCustom extends StatelessWidget {
  final String label;
  final bool selected;
  final Color? activeColor;
  final Color? textColor;
  final Function(String) onSelect;

  const SelectButtonsCustom({
    required this.label,
    required this.selected,
    required this.onSelect,
    this.activeColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(label);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(right: 15, top: 10),
        decoration: BoxDecoration(
          color:
              selected ? activeColor ?? Constants.pColor : Constants.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          '$label ',
          style: TextStyle(
            fontSize: 13,
            color: selected ? textColor ?? Colors.white : Constants.textColor2,
          ),
        ),
      ),
    );
  }
}
