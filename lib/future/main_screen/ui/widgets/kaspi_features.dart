import 'package:flutter/material.dart';

class KaspiFeatures extends StatelessWidget {
  const KaspiFeatures({super.key});

  Widget kaspiFeaturesWithTextAndIcon({
    required Widget image,
    required String text,
    required String subtitleText,
    required BuildContext context,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxHeight * 0.8,
            height: constraints.maxHeight * 0.6,
            child: image,
          );
        }),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitleText.isEmpty
                  ? const SizedBox()
                  : Text(
                      subtitleText,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
            ],
          ),
        )
      ],
    );
  }

  static const List<String> featuresImage = [
    'assets/icons/kaspi_kredit.png',
    'assets/icons/kaspi_tenge.png',
    'assets/icons/kaspi_kredit_with_nalichnim.png',
    'assets/icons/kaspi_red.png'
  ];
  static const List<String> featuresTitle = [
    'Кредит на Покупки',
    'Kaspi Депозит',
    'Кредит Наличными',
    'Kaspi Red',
  ];
  static const List<String> featuresSubtitle = [
    'Кредит или рассрочка 0%',
    '',
    'до 1 млн тенге',
    'Рассрочка 0% и Бонусы',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 160,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Количество элементов в одном ряду
                    mainAxisSpacing: 1, // Расстояние между строками
                    crossAxisSpacing: 1, // Расстояние между элементами
                    childAspectRatio: 0.3, // Соотношение сторон элементов
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return kaspiFeaturesWithTextAndIcon(
                        context: context,
                        image: Image.asset(featuresImage[index]),
                        subtitleText: featuresSubtitle[index],
                        text: featuresTitle[index]);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
