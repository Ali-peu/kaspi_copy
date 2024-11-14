import 'package:flutter/material.dart';

class SaleContainer extends StatelessWidget {
  const SaleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.purple];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          // itemHeight: MediaQuery.of(context).size.height * 0.2,
          // itemWidth: MediaQuery.of(context).size.width * 0.4,
          // autoplay: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: colors[index],
                ),
              ),
            );
          }),
    );
  }
}
