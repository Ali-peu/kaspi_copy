import 'package:flutter/material.dart';
import 'package:kaspi_copy/future/local_auth_screen/ui/widgets/entered_fields.dart';
import 'package:kaspi_copy/future/local_auth_screen/ui/widgets/pincode_fields.dart';

class LocalAuthScreen extends StatelessWidget {
  const LocalAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            imageIcon(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
          ],
        ),
        EnteredFields(

        ),
        Flexible(child: PincodeFields()),
      ],
    );
  }

  Column imageIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.25), // border color
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2), // border width
            child: Container(
              // or ClipRRect if you need to clip the content
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // inner circle color
              ),
              child: Container(), // inner content
            ),
          ),
        ),
        const Text('Нұрбақ И.')
      ],
    );
  }
}
