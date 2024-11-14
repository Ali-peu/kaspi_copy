import 'package:flutter/material.dart';

class OnlineStoreLikeWeb extends StatefulWidget {
  const OnlineStoreLikeWeb({super.key});

  @override
  State<OnlineStoreLikeWeb> createState() => _OnlineStoreLikeWebState();
}

class _OnlineStoreLikeWebState extends State<OnlineStoreLikeWeb>
    with TickerProviderStateMixin {
  late TabController? controller;

  @override
  initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  Widget sizedBox() {
    return SizedBox(
      height: 120,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: Text('Empty'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // SliverList.builder(
    //                 itemCount: controller
    //                     .getAdListRowDataFromSelectedAdServiceType()
    //                     .length,
    //                 itemBuilder: (context, index) {
    //                   final ad = controller
    //                       .getAdListRowDataFromSelectedAdServiceType()[index];
    //                   return AppAdItem(
    //                     imageBoxFit: BoxFit.contain,
    //                     onTap: () {
    //                       controller.onAdTap(context, index);
    //                     },
    //                     adListRowData: ad,
    //                   );
    //                 })
    return Column(
      children: [
        TabBar(controller: controller, tabs: const [
          Tab(text: 'Рекомендации'),
          Tab(text: 'Скидки'),
          Tab(text: 'Горящие туры'),
        ]),
        Expanded(
          child: TabBarView(controller: controller, children: [
            sizedBox(),
            sizedBox(),
            sizedBox(),
          ]),
        )
      ],
    );
  }
}
