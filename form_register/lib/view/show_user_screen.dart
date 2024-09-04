import 'package:flutter/material.dart';
import 'package:form_register/model/user_model.dart';

class ShowUserScreen extends StatelessWidget {
  const ShowUserScreen({super.key, required this.users});

  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(users[0].nome),
            Text(users[0].phone.toString()),
            Text(users[0].nome),
            Text(users[0].address)
          ],
        ),
      ),
    );
  }
}
