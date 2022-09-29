 import 'package:flutter/material.dart';

import '../helpers/text_styles.dart';
import '../router/navigator.dart';
import 'custom_images.dart';

class AppNotification {
  final String message;
  final String? iconName;
  final Color backgroundColor;
  final Color borderColor;
  final bool isFloating;
  late final double radius;
  AppNotification(
      {required this.message,
      this.iconName,
      this.backgroundColor = Colors.black,
      this.borderColor = Colors.transparent,
      this.isFloating = false,
      radius}) {
    this.radius = radius ?? (isFloating ? 15 : 0);
  }
}


showSnackBar({required AppNotification notification}) {
    CustomNavigator.scaffoldState.currentState!.showSnackBar(
      SnackBar(
        behavior: notification.isFloating
            ? SnackBarBehavior.floating
            : SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(notification.radius),
            side: BorderSide(width: 1, color: notification.borderColor)),
        margin: notification.isFloating ? EdgeInsets.all(24) : null,
        content: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                if (notification.iconName != null)
                  customImageIconSVG(
                      imageName: notification.iconName, color: Colors.white),
                if (notification.iconName != null) SizedBox(width: 8),
                Expanded(
                  child: Text(
                    notification.message,
                    style: AppTextStyles.w600.copyWith(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: notification.backgroundColor,
      ),
    );
  }