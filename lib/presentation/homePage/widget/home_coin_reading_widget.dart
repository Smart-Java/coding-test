import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';

class HomeCoinReadingWidget extends StatelessWidget {
  const HomeCoinReadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              coinWidget(
                coinBgColor: AppColors.ethWalletColor,
                coinSVGAssetPath: 'assets/home/svg/bitcoin_wallet.svg',
                coinName: 'BTCUSDT',
                coinPercentage: '36.77 %',
              ),
              const AppSpacerWidget(
                width: 10.0,
              ),
              coinWidget(
                coinBgColor: AppColors.ethWalletColor,
                coinSVGAssetPath: 'assets/home/svg/eth_wallet.svg',
                coinName: 'ETHUSDT',
                coinPercentage: '24.77 %',
              ),
              const AppSpacerWidget(
                width: 10.0,
              ),
              coinWidget(
                coinBgColor: AppColors.bnbWalletColor,
                coinSVGAssetPath: 'assets/home/svg/binance_wallet.svg',
                coinName: 'BNBUSDT',
                coinPercentage: '36.07 %',
              ),
              const AppSpacerWidget(
                width: 10.0,
              ),
            ],
          ),
        ),
        const AppSpacerWidget(
          height: 20.0,
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 2.5,
              color: AppColors.bgElement,
            ),
            Container(
              width: 200.0,
              height: 2.5,
              color: AppColors.whiteColor,
            )
          ],
        ),
      ],
    );
  }

  Widget coinWidget(
      {required Color coinBgColor,
      required String coinSVGAssetPath,
      required String coinName,
      required String coinPercentage}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 150.0,
      width: 130.0,
      decoration: BoxDecoration(
        color: AppColors.bgFormColorElement,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60.0,
            width: 60.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: coinBgColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20.0)),
            child: Center(
              child: SvgPicture.asset(coinSVGAssetPath),
            ),
          ),
          const AppSpacerWidget(
            height: 10.0,
          ),
          Expanded(
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coinName,
                    style: const TextStyle(fontSize: 13.0),
                  ),
                  Text(
                    coinPercentage,
                    style: const TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
