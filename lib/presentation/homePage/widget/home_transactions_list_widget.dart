import 'package:flutter/material.dart';
import 'package:login_system/domain/homeTxnModel/home_txn_model.dart';
import 'package:login_system/infrastructure/config/appColors/app_colors.dart';
import 'package:login_system/infrastructure/util/appSpacerWidget/app_spacer_widget.dart';
import 'package:login_system/presentation/homePage/widget/home_txn_list_item_widget.dart';

class HomeTransactionsListWidget extends StatefulWidget {
  const HomeTransactionsListWidget({super.key});

  @override
  State<HomeTransactionsListWidget> createState() =>
      _HomeTransactionsListWidgetState();
}

class _HomeTransactionsListWidgetState
    extends State<HomeTransactionsListWidget> {
  bool optionSelected = true;
  List<HomeTxnModel> txn = const [
    HomeTxnModel(
      title: 'EMA Cross 50  200 + ADX\n(Long)',
      distribution: 'Distribution Bot',
      isItActive: true,
    ),
    HomeTxnModel(
      title: 'EMA Cross 50  200 + ADX\n(Long)',
      distribution: 'Distribution Bot',
      isItActive: false,
    ),
    HomeTxnModel(
      title: 'EMA Cross 50  200 + ADX\n(Long)',
      distribution: 'Distribution Bot',
      isItActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            txnOptions(title: 'Signal Groups', selected: optionSelected),
            const AppSpacerWidget(
              width: 20.0,
            ),
            txnOptions(title: 'Bots', selected: optionSelected),
          ],
        ),
        const AppSpacerWidget(
          height: 20.0,
        ),
        ...List.generate(txn.length, (index) {
          return HomeTxnListItemWidget(
            distri: txn[index].distribution,
            emaTitle: txn[index].title,
            isItActive: txn[index].isItActive,
          );
        })
      ],
    );
  }

  Widget txnOptions({required String title, required bool selected}) {
    return Container(
      height: 40.0,
      width: 120.0,
      padding: const EdgeInsets.all(
        7.0,
      ),
      decoration: selected
          ? BoxDecoration(
              color: AppColors.homeOptionsColor,
              borderRadius: BorderRadius.circular(
                25,
              ),
            )
          : const BoxDecoration(),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
