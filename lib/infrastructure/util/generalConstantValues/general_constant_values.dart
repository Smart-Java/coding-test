import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';

TextStyle errorTextStyle = const TextStyle(
  fontSize: 14.0,
  overflow: TextOverflow.clip,
);

OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.textFieldBorderColor,
    ),
    borderRadius: BorderRadius.circular(50.0));

OutlineInputBorder borderTextFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50.0),
  borderSide: const BorderSide(
    color: AppColors.textFieldBorderColor,
  ),
);
