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
      Service('Магазин', 'assets/icons/store_12.png'),
      Service('Мой банк', 'assets/icons/my_bank.png'),
      Service('Платеж', 'assets/icons/platezh.png'),
      Service('Переводы', 'assets/icons/perevod.png'),
      Service('Travel', 'assets/icons/travel.png'),
      Service('Travel', 'assets/icons/travel.png'),
      Service('Гос услуги', 'assets/icons/gos_uslugi.png'),
      Service('Объявление', 'assets/icons/ads.png'),
    ];
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
              icon:
                  Image.asset(services[index].iconPath, height: 50, width: 50),
            ),
          );
        },
        childCount: services.length,
      ),
    );
  }
}
