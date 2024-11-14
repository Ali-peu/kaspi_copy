import 'package:flutter/material.dart';

class KaspiFeatures extends StatelessWidget {
  const KaspiFeatures({super.key});

  Widget kaspiFeaturesWithTextAndIcon(
      {required Widget image, required String text}) {
    return ColoredBox(
      color: Colors.blue,
      child: ListTile(
        leading: image,
        title: Text(text),
        subtitle: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Количество элементов в одном ряду
                  mainAxisSpacing: 5.0, // Расстояние между строками
                  crossAxisSpacing: 7.0, // Расстояние между элементами
                  childAspectRatio: 0.45, // Соотношение сторон элементов
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return kaspiFeaturesWithTextAndIcon(
                      image: const Icon(Icons.monetization_on),
                      text: 'Кредиты');
                },
              ),
            ),
          ],
        ));
  }
}
