import 'package:flutter/material.dart';
import 'package:form_register/model/user_model.dart';
import 'package:form_register/view/show_user_screen.dart';

class RegisterUser extends StatefulWidget {
  RegisterUser({super.key});

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String? _selectedGender; 
  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [];

    void saveInfo() {
      users.add(UserModel(
        email: emailController.text,
        phone: int.tryParse(phoneController.text) ?? 0,
        nome: nameController.text,
        address: addressController.text,
        gender: _selectedGender ?? "Escolha um gênero"
      ));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, make your register!!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Phone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Address',
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Select your gender:'),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                Text('Masculino'),
                Radio<String>(
                  value: 'Masculino',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                Text('Feminino'),
             
                
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    saveInfo();
                    print("Saved");
                  },
                  child: Text("Register"),
                ),
                SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () {
                    if (users.length > 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ShowUserScreen(users: users),
                        ),
                      );
                    } else {
                      const snackBar = SnackBar(
                        content: Text('Create a user first'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text("Show Users"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
