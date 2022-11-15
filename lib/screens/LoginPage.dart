import 'package:flutter/material.dart';

import '../utilities/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.headerText, required this.callback}) : super(key: key);
  final String headerText;
  final Function callback;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: const BackButton(),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 30),
                    child: Text(
                      widget.headerText,
                      style: textFontBig,
                    ),
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Username'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      widget.callback(usernameController.text, passwordController.text,isChecked);
                    },
                    style:
                        ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue), minimumSize: MaterialStateProperty.all(const Size.fromHeight(0))),
                    child: const Text(
                      "Login",
                      style: textFontBold,
                    ),
                  ),
                ],
              ),
            ),
            CheckboxListTile(
                contentPadding: const EdgeInsets.only(left: 24,right: 24,top: 5),
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text("Keep me logged"),
                subtitle: const Text("Keyforgery will add your new w/l automatically"),
                value: isChecked,
                activeColor: Colors.blue,
                onChanged: (bool? newValue) {
                  setState(() {
                    isChecked = newValue ?? !isChecked;
                  });
                })
          ],
        ),
      ),
    );
  }
}
