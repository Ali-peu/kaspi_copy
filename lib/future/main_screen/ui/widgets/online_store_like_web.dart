import 'package:flutter/material.dart';

class OnlineStoreLikeWeb extends StatefulWidget {
  const OnlineStoreLikeWeb({super.key});

  @override
  State<OnlineStoreLikeWeb> createState() => _OnlineStoreLikeWebState();
}

class _OnlineStoreLikeWebState extends State<OnlineStoreLikeWeb>
    with TickerProviderStateMixin {
  late TabController? controller;

  final List<String> iconsPath = [
    '',
    'assets/icons_from_original/fire.png',
    'assets/icons_from_original/lightning.png',
    'assets/icons/kaspi_magnum.png',
  ];

  final List<String> images = [
    'assets/online_market/hdmi_1.webp',
    'assets/online_market/hdmi_2.webp',
    'assets/online_market/phone_1.webp',
    'assets/online_market/phone_2.webp',
    'assets/online_market/phone_3.webp',
    'assets/online_market/printer.webp',
    'assets/online_market/home_1.webp',
    'assets/online_market/usb_hub.webp',
    'assets/online_market/hdmi_2.webp',
    'assets/online_market/hdmi_2.webp',
  ];

  final List<String> imagesText = [
    'HDMI кабель 1м, 8К, ver 2.1, игровой, цифровой',
    "HDMI кабель 1м, 4k, ver 2.0, игровой, цифровой",
    "Coolpad Смартфон cool 10a Global 4/128 ГБ, серебристый",
    "Apple Смартфон iPhone 16 Pro, eSIM+SIM 8/1 ТБ, белый ",
    "Редми 10 64 ГБ 2 ядра",
    "Canon Принтер струйный Pixma G1410 , черный",
    "Гирлянда на елку 6м разноцветная / Электрогирлянда новогодняя / уличная и домашняя",
    "USB Флеш-накопитель 256 GB USB, флешка usb",
    'HDMI кабель 1м, 8К, ver 2.1, игровой, цифровой',
    "HDMI кабель 1м, 4k, ver 2.0, игровой, цифровой",
  ];

  final List<String> imagesTypeText = [
    'Техника',
    "Техника",
    "Смартфоны",
    "Смартфоны",
    "Смартфоны",
    "Принтер",
    "Для дома",
    "Техника"
        'Техника',
    "Техника",
  ];

  @override
  initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  Widget gridviewShop() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return gridElement(index: index);
        });
  }

  Widget gridElement({required int index}) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(children: [
            Image.asset(
              images[index],
              height: MediaQuery.of(context).size.width * 0.52,
              width: MediaQuery.of(context).size.width * 0.48,
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  )),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  imagesText[index],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  imagesTypeText[index],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
            controller: controller,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: [
              const TabWithImageInRow(
                text: 'Рекомендации',
              ),
              TabWithImageInRow(
                text: 'Скидки',
                icon: SizedBox(
                    height: 20, width: 20, child: Image.asset(iconsPath[1])),
              ),
              TabWithImageInRow(
                text: 'Горящие туры',
                icon: SizedBox(
                    height: 20, width: 20, child: Image.asset(iconsPath[2])),
              ),
              TabWithImageInRow(
                text: 'Magnum',
                icon: SizedBox(
                    height: 20, width: 20, child: Image.asset(iconsPath[3])),
              ),
            ]),
        Expanded(
          child: TabBarView(controller: controller, children: [
            gridviewShop(),
            gridviewShop(),
            gridviewShop(),
            gridviewShop()
          ]),
        )
      ],
    );
  }
}

class TabWithImageInRow extends Tab {
  const TabWithImageInRow({
    super.key,
    required String super.text,
    super.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        super.icon ?? const SizedBox(),
        Text(super.text ?? 'no'),
      ],
    );
  }
}
