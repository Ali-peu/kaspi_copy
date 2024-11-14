import 'package:flutter/material.dart';
import 'package:kaspi_copy/app/app_widgets/service_item_with_icon_and_name.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/kaspi_features.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/online_store_like_web.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/sale_container.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SaleContainer(),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // Количество колонок
                  crossAxisSpacing: 0.05, // Расстояние между колонками
                  mainAxisSpacing: 2, // Расстояние между строками
                  childAspectRatio: 0.90),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const ServiceItemWithIconAndName(
                    name: 'Магазин',
                    icon: (Icons.store),
                  );
                },
                childCount: 8,
              ),
            ),
            const SliverToBoxAdapter(
              child: KaspiFeatures(),
            ),
            const SliverFillRemaining(
              hasScrollBody: true,
              child: OnlineStoreLikeWeb(),
            )
          ],
        ),
      ),
    );
  }
}
