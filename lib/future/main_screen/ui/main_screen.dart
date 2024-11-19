import 'package:flutter/material.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/kaspi_features.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/kaspi_service_sliver_grid.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/online_store_like_web.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/sale_container.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/search_from_main.dart';
import 'package:kaspi_copy/future/main_screen/ui/widgets/search_widget.dart';

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
            SliverToBoxAdapter(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                      child: GlobalSearchFieldWidget(),
                    ))),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            const SliverToBoxAdapter(
              child: SaleContainer(),
            ),
            KaspiServiceSliverGrid(),
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
