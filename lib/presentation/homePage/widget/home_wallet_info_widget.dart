import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';

class HomeWalletInfoWidget extends StatelessWidget {
  const HomeWalletInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        image: const DecorationImage(
          image: AssetImage(
            'assets/home/png/wallet_card.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Wallet',
                style: TextStyle(fontSize: 13.0),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    height: 42,
                    width: 110,
                    padding: const EdgeInsets.all(
                      5.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/home/svg/binance_card.svg',
                        ),
                        const AppSpacerWidget(
                          width: 5.0,
                        ),
                        const Text(
                          'Binance',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const AppSpacerWidget(
            height: 20.0,
          ),
          const Text(
            'Account Balance',
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
          const AppSpacerWidget(
            height: 5.0,
          ),
          const Text(
            '\$ 12 480.00',
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}
