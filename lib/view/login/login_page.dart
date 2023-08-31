import 'package:fav_random_demo/controller/home_controller.dart';
import 'package:fav_random_demo/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<HomeController>(builder: (homeController) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter user name';
                    }
                    return null;
                  },
                  controller: homeController.userNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter User Name',
                      labelText: 'User Name'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  controller: homeController.passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Enter Password',
                      labelText: 'Password'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await homeController.loginData();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      }
                    },
                    child: Text('Submit'))
              ],
            ),
          );
        }),
      ),
    );
  }
}
