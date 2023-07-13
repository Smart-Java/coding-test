import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';

class AuthenticationSuccessMessageDialogWidget extends StatefulWidget {
  final String message;
  final VoidCallback routeFunctionality;
  const AuthenticationSuccessMessageDialogWidget({
    Key? key,
    required this.message,
    required this.routeFunctionality,
  }) : super(key: key);

  @override
  State<AuthenticationSuccessMessageDialogWidget> createState() =>
      _AuthenticationSuccessMessageDialogWidgetState();
}

class _AuthenticationSuccessMessageDialogWidgetState
    extends State<AuthenticationSuccessMessageDialogWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: AppColors.mainGoldColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.mainGoldColor,
                width: 2.0,
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.check,
                color: AppColors.whiteColor,
                size: 50.0,
              ),
            ),
          ),
        ),
        content: SizedBox(
          height: 150.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  widget.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  onTap: widget.routeFunctionality,
                  child: alertMessageBtnFunctionality(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget alertMessageBtnFunctionality() {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.mainGoldColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          btnMessageText(),
          style: const TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  String btnMessageText() {
    return 'Okay';
  }
}
