import 'package:flutter/material.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';
import 'package:login_system/presentation/homePage/widget/home_bottom_nav_item_widget.dart';
import 'package:login_system/presentation/homePage/widget/home_coin_reading_widget.dart';
import 'package:login_system/presentation/homePage/widget/home_header_widget.dart';
import 'package:login_system/presentation/homePage/widget/home_transactions_list_widget.dart';
import 'package:login_system/presentation/homePage/widget/home_wallet_info_widget.dart';

class HomePageScaffoldWidget extends StatefulWidget {
  const HomePageScaffoldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageScaffoldWidget> createState() => _HomePageScaffoldWidgetState();
}

class _HomePageScaffoldWidgetState extends State<HomePageScaffoldWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Container(
        margin: const EdgeInsets.only(
          top: 40.0,
        ),
        padding: const EdgeInsets.all(20.0),
        child: const Column(
          children: [
            HomeHeaderWidget(),
            AppSpacerWidget(
              height: 10.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeWalletInfoWidget(),
                    AppSpacerWidget(
                      height: 20.0,
                    ),
                    HomeCoinReadingWidget(),
                    AppSpacerWidget(
                      height: 30.0,
                    ),
                    HomeTransactionsListWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 85.0,
        decoration: const BoxDecoration(
          color: AppColors.bgElement,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeBottomNavItemWidget(iconPath: 'assets/home/svg/home_icon.svg'),
            HomeBottomNavItemWidget(iconPath: 'assets/home/svg/activity.svg'),
            HomeBottomNavItemWidget(iconPath: 'assets/home/svg/setting.svg'),
          ],
        ),
      ),
    );
  }
}
