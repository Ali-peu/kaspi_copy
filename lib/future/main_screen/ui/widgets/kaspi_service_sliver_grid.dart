import 'package:flutter/material.dart';
import 'package:kaspi_copy/app/app_widgets/service_item_with_icon_and_name.dart';

class Service {
  final String name;
  final String iconPath;

  Service(this.name, this.iconPath);
}

class KaspiServiceSliverGrid extends StatelessWidget {
  const KaspiServiceSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Service> services = [
      Service('Магазин', 'assets/icons/kaspi_shop_main.png'),
      Service('Мой банк', 'assets/icons/kaspi_bank.png'),
      Service('Платеж', 'assets/icons/kaspi_platezh.png'),
      Service('Переводы', 'assets/icons/kaspi_perevod.png'),
      Service('Magnum', 'assets/icons/kaspi_magnum.png'),
      Service('Travel', 'assets/icons/kaspi_travel_main.png'),
      Service('Гос услуги', 'assets/icons/kaspi_gov.png'),
      Service('Объявлени', 'assets/icons/kaspi_ad.png'),
    ];
    final List<double> heightList = [50, 45, 35, 35, 45, 45, 45, 44];
    final List<double> widthList = [50, 45, 42, 42, 48, 48, 42, 48];

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 1,
          mainAxisSpacing: 0.1,
          childAspectRatio: 1.25),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: ServiceItemWithIconAndName(
                name: services[index].name,
                icon: Image.asset(services[index].iconPath,
                    height: heightList[index], width: widthList[index])),
          );
        },
        childCount: services.length,
      ),
    );
  }
}
