import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspi_copy/future/local_auth_screen/bloc/local_auth_bloc.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  final int pinLength = 10; // Длина PIN-кода
  List<String?> _enteredPin = [];

  int getValue(List<String?> list) {
    String value = '';
    for (var element in list) {
      value = value + element!;
    }

    return int.tryParse(value) ?? 0;
  }

  // Функция для создания кнопок с цифрами
  Container textCode(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 60,
      height: 60,
      child: child,
    );
  }

  ElevatedButton textButton(int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (_enteredPin.length <= 4) {
            _enteredPin.add(index.toString());
          }
          if (_enteredPin.length == 4) {
            context
                .read<LocalAuthBloc>()
                .add(EnterPassword(pincode: getValue(_enteredPin)));
          }
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
      ),
      child: Text(
        index.toString(),
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocalAuthBloc, LocalAuthState>(
      listener: (context, state) {
        if (state.isSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Success')));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('UNSuccess')));
        }
      },
      child: BlocBuilder<LocalAuthBloc, LocalAuthState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return _enteredPin.length > index
                            ? textCode(textButton(
                                int.parse(_enteredPin[index] ?? '0')))
                            : SizedBox(
                                width: 60,
                                height: 60,
                                child: textCode(
                                    const ColoredBox(color: Colors.red)),
                              ); // Если еще не введен PIN, оставляем пустое место
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount:
                        12, // 9 цифр + 1 пустая ячейка + 2 пустые ячейки для центрирования
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 колонки
                      crossAxisSpacing: 10, // Расстояние между элементами
                      mainAxisSpacing: 10, // Расстояние между строками
                      childAspectRatio:
                          1, // Соотношение сторон (круглые кнопки)
                    ),
                    itemBuilder: (context, index) {
                      // Центрирование кнопок
                      if (index == 9) {
                        return Container(); // Пустая ячейка (для центрирования)
                      }

                      if (index == 11) {
                        return textCode(IconButton.outlined(
                            onPressed: () {
                              _enteredPin.clear();
                              setState(() {});
                            },
                            icon: const Icon(Icons.clear_sharp)));
                      }

                      if (index == 10) {
                        return textCode(textButton(0)); // Кнопка с цифрой 0
                      }

                      // Остальные кнопки с цифрами от 1 до 9
                      return textCode(textButton(index + 1));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
