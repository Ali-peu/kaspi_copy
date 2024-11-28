import 'package:flutter/material.dart';

class SaleContainer extends StatelessWidget {
  const SaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> assetsPath = [
      'assets/main_history_images/2.png',
      'assets/main_history_images/3.png',
      'assets/main_history_images/4.png',
      'assets/main_history_images/1.png',
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            // itemHeight: MediaQuery.of(context).size.height * 0.2,
            // itemWidth: MediaQuery.of(context).size.width * 0.4,
            // autoplay: true,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(assetsPath[index]),
              );
            }),
      ),
    );
  }
}
