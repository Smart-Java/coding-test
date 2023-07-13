import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';

void snackBarMessage(
    {required BuildContext context,
    required String message,
    required Size deviceSize}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text(message)),
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            icon: const Icon(
              Icons.close,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
      duration: const Duration(
        seconds: 2,
      ),
      backgroundColor: AppColors.snackBarBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(
        bottom: deviceSize.height - 100,
        right: 10.0,
        left: 10.0,
      ),
    ),
  );
}
