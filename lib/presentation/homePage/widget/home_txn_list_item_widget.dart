import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';

class HomeTxnListItemWidget extends StatelessWidget {
  final String emaTitle;
  final String distri;
  final bool isItActive;
  const HomeTxnListItemWidget({
    super.key,
    required this.distri,
    required this.emaTitle,
    required this.isItActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: AppColors.bgElement,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                emaTitle,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Container(
                    width: 90,
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: isItActive
                          ? AppColors.activeColor.withOpacity(0.3)
                          : AppColors.inActiveColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10.0,
                          width: 10.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isItActive
                                ? AppColors.activeColor
                                : AppColors.inActiveColor,
                          ),
                        ),
                        const AppSpacerWidget(
                          width: 10.0,
                        ),
                        Text(
                          isItActive ? 'Active' : 'Inactive',
                          style: TextStyle(
                            color: isItActive
                                ? AppColors.activeColor
                                : AppColors.inActiveColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const AppSpacerWidget(
            height: 10.0,
          ),
          Text(
            distri,
            style: const TextStyle(
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
