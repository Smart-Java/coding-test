import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/config/appRouterHandler/app_router.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';
import 'package:login_system/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:login_system/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:login_system/presentation/authenticationPage/bloc/authentication_page_bloc.dart';
import 'package:login_system/presentation/authenticationPage/bloc/event/authentication_page_event.dart';
import 'package:login_system/presentation/authenticationPage/bloc/state/authentication_page_state.dart';
import 'package:login_system/presentation/authenticationPage/widget/authentication_dont_have_account_widget.dart';
import 'package:login_system/presentation/authenticationPage/widget/authentication_google_apple_widget.dart';
import 'package:login_system/presentation/authenticationPage/widget/authentication_or_widget.dart';
import 'package:login_system/presentation/authenticationPage/widget/successMessageWidget/authentication_success_message_dialog_widget.dart';

class AuthenticationLoginWidget extends StatefulWidget {
  const AuthenticationLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthenticationLoginWidget> createState() =>
      _AuthenticationLoginWidgetState();
}

class _AuthenticationLoginWidgetState extends State<AuthenticationLoginWidget> {
  final mobileNumberController = TextEditingController();
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  final formStateKey = GlobalKey<FormState>();

  bool loading = false;
  bool passwordShouldBeInvisible = true;

  bool emailAddressVerified = true;

  bool isThereErrorForLoginPasswordField = false;
  bool isThereErrorForLoginEmailField = false;

  Size deviceSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    setState(() {
      deviceSize = size;
    });

    return BlocConsumer<AuthenticationPageBloc, AuthenticationPageState>(
      listener: (context, state) {
        if (state.authenticationMessage != null &&
            (state.isRequestSuccessful == false)) {
          snackBarMessage(
            context: context,
            deviceSize: deviceSize,
            message: state.authenticationMessage!,
          );
          Future.delayed(const Duration(seconds: 5)).then((value) {
            context.replaceRoute(const HomeRoute());
          });
        }

        if (state.isEmailAddressFormatTrue == true ||
            state.isEmailAddressFormatTrue == false) {
          setState(() {
            emailAddressVerified = state.isEmailAddressFormatTrue!;
          });
        }

        if (state.isLoading == true || state.isLoading == false) {
          setState(() {
            loading = state.isLoading!;
          });
        }

        if (state.isRequestSuccessful == true) {
          showDialog(
            context: context,
            builder: (context) {
              return AuthenticationSuccessMessageDialogWidget(
                message: state.authenticationMessage!,
                routeFunctionality: () {
                  context.replaceRoute(const HomeRoute());
                },
              );
            },
          );
        }

        if (state.isPasswordFieldEmpty == true ||
            state.isPasswordFieldEmpty == false) {
          setState(() {
            isThereErrorForLoginPasswordField = state.isPasswordFieldEmpty!;
          });
        }

        if (state.isEmailFieldEmpty == true ||
            state.isEmailFieldEmpty == false) {
          setState(() {
            isThereErrorForLoginEmailField = state.isEmailFieldEmpty!;
          });
        }
      },
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 55.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        color: AppColors.whiteColor,
                        size: 24.0,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.center,
                        child: Text(
                          'Log In',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: AppColors.bgFormColorElement,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: Column(
                    children: [
                      Form(
                        key: formStateKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 30.0,
                              ),
                              child: textFieldHeaderWidget(
                                child: TextField(
                                  controller: emailAddressController,
                                  keyboardType: TextInputType.emailAddress,
                                  enabled: !loading,
                                  cursorColor: AppColors.mainGoldColor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.textFieldFilledColor,
                                    hintText: 'you@example.com',
                                    errorText: emailAddressController
                                            .text.isNotEmpty
                                        ? emailAddressVerified == false
                                            ? 'Enter a vaild email address'
                                            : isThereErrorForLoginEmailField ==
                                                    true
                                                ? 'Enter a vaild email address'
                                                : null
                                        : isThereErrorForLoginEmailField == true
                                            ? 'Enter a vaild email address'
                                            : null,
                                    errorStyle: errorTextStyle,
                                    border: borderTextFieldBorder,
                                    disabledBorder: borderTextFieldBorder,
                                    enabledBorder: borderTextFieldBorder,
                                    focusedBorder: borderTextFieldBorder,
                                  ),
                                  onChanged: (value) {
                                    BlocProvider.of<AuthenticationPageBloc>(
                                            context)
                                        .add(
                                      ValidateEmailAddressForAuthentication(
                                        emailAddress:
                                            emailAddressController.text,
                                      ),
                                    );
                                  },
                                ),
                                title: 'Email Address',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: textFieldHeaderWidget(
                                  child: TextField(
                                    controller: passwordController,
                                    keyboardType: TextInputType.text,
                                    enabled: !loading,
                                    obscureText: passwordShouldBeInvisible,
                                    cursorColor: AppColors.mainGoldColor,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.textFieldFilledColor,
                                      hintText: 'Not less than 8 characters',
                                      errorText:
                                          isThereErrorForLoginPasswordField ==
                                                  true
                                              ? 'Password is required'
                                              : null,
                                      errorStyle: errorTextStyle,
                                      border: borderTextFieldBorder,
                                      disabledBorder: borderTextFieldBorder,
                                      enabledBorder: borderTextFieldBorder,
                                      focusedBorder: borderTextFieldBorder,
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passwordShouldBeInvisible =
                                                !passwordShouldBeInvisible;
                                          });
                                        },
                                        icon: Icon(
                                          passwordShouldBeInvisible == false
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color:
                                              AppColors.passwordVisibilityColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: 'Password'),
                            ),
                          ],
                        ),
                      ),
                      const AppSpacerWidget(
                        height: 32.0,
                      ),
                      GestureDetector(
                        onTap: loading == true
                            ? null
                            : () async {
                                await loginUser(context: context);
                              },
                        child: Container(
                          height: 56.0,
                          decoration: const BoxDecoration(
                            color: AppColors.formBackgroundButtonColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.0),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              loading == true ? 'Processing...' : 'Login',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                const AuthenticationOrWidget(),
                const AppSpacerWidget(
                  height: 10.0,
                ),
                const AuthenticationGoogleAppleWidget(),
                const AppSpacerWidget(
                  height: 10.0,
                ),
                const AuthenticationDontHaveAccountWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> loginUser({required BuildContext context}) async {
    BlocProvider.of<AuthenticationPageBloc>(context).add(
      LoginAuthenticationEvent(
        emailAddress: emailAddressController.text,
        password: passwordController.text,
      ),
    );
  }

  Widget textFieldHeaderWidget({
    required String title,
    required Widget child,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        const AppSpacerWidget(
          height: 10.0,
        ),
        child,
      ],
    );
  }
}
