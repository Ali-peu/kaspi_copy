import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspi_copy/future/local_auth_screen/bloc/local_auth_bloc.dart';
import 'package:kaspi_copy/future/local_auth_screen/ui/widgets/circle_text_widget.dart';

class PincodeFields extends StatefulWidget {
  const PincodeFields({super.key});

  @override
  State<PincodeFields> createState() => _PincodeFieldsState();
}

class _PincodeFieldsState extends State<PincodeFields> {
  Widget textButton(int index) {
    return SizedBox(
      height: 20,
      width: 20,
      child: ElevatedButton(
        onPressed: () {
          context
              .read<LocalAuthBloc>()
              .add(AddEnterPin(pinValue: index.toString()));
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), padding: const EdgeInsets.all(4)),
        child: Center(
          child: Text(
            index.toString(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.33,
      width: MediaQuery.of(context).size.width / 2,
      child: GridView.builder(
        itemCount:
            12, // 9 цифр + 1 пустая ячейка + 2 пустые ячейки для центрирования
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 колонки
          crossAxisSpacing: 0.11, // Расстояние между элементами
          mainAxisSpacing: 0.11, // Расстояние между строками
          childAspectRatio: 1, // Соотношение сторон (круглые кнопки)
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return Container();
          }

          if (index == 10) {
            return CircleTextWidget(child: textButton(0));
          }

          if (index == 11) {
            return CircleTextWidget(
                child: GestureDetector(
                    onTap: () {
                      context.read<LocalAuthBloc>().add(const ClearPinCode());
                    },
                    child: const Icon(Icons.clear_sharp)));
          }

          return CircleTextWidget(child: textButton(index + 1));
        },
      ),
    );
  }
}
