import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:login_system/presentation/homePage/widget/home_page_scaffold_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,
      left: false,
      right: false,
      child: HomePageScaffoldWidget(),
    );
  }
}
