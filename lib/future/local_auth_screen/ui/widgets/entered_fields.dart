import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspi_copy/future/local_auth_screen/bloc/local_auth_bloc.dart';
import 'package:kaspi_copy/future/local_auth_screen/ui/widgets/circle_text_widget.dart';

class EnteredFields extends StatelessWidget {
  const EnteredFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalAuthBloc, LocalAuthState>(
      builder: (context, state) {
        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return state.enteredPin.length > index
                  ? SizedBox(
                      width: 30,
                      height: 30,
                      child: Text(
                        (state.enteredPin[index]),
                      ))
                  : const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircleTextWidget(
                          child: ColoredBox(color: Colors.red)),
                    ); // Если еще не введен PIN, оставляем пустое место
            }),
          ),
        );
      },
    );
    ();
  }
}
