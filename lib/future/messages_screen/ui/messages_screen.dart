import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Сообщение'),
        ),
        Divider(),
        ListTile(
          leading: Text('data'),
          title: Text('data'),
          subtitle: Text('data'),
        ),
        ListTile(
          leading: Text('data'),
          title: Text('data'),
          subtitle: Text('data'),
        ),
        ListTile(
          leading: Text('data'),
          title: Text('data'),
          subtitle: Text('data'),
        )
      ],
    );
  }
}
