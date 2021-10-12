import 'package:demo/database/database.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants.dart';

import 'package:demo/controller/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final controller = LoginController();

  String _username = '';
  String _password = '';

  Widget _usernameField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) _username = value;
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        labelText: 'Username',
        hintText: 'Enter your username',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 5
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 5
        ),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) _password = value;
      },
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.only(left: 20, right: 20),
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 25
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            borderSide: BorderSide(color: Colors.black54),
            gapPadding: 25
        )
      ),
    );
  }

  Widget errorsText(String? s) {
    if(s != null) return Text(s);
    return const Text('');
  }

  @override
  Widget build(BuildContext context) {
    List<String?> errors = controller.errors;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: titleStyle,
        ),
        centerTitle: true,
        backgroundColor: mainColor,

      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _usernameField(),
              spaceV,
              _passwordField(),
              spaceV,
              Column(
                children: errors.map(errorsText).toList(),
              ),
              spaceV,
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: mainColor, width: 2)
                    )
                  )
                ),
                onPressed: () async {
                  setState(() {
                    errors = controller.errors;
                  });

                  DatabaseHelper.instance.dropAll();
                  controller.init();
                  if(await controller.isValid(_username, _password)) {
                    controller.callMainScreen(context);
                  }


                  // DatabaseHelper.instance.delete();

                },
                child: const Text(
                  '    Login    ',
                  style: TextStyle(color: mainTextColor),
                ),
              ),
              spaceV,
              Row(
                children: [
                  const Text(' Don\'t have account? '),
                  TextButton(
                    onPressed: () {
                      controller.callRegister(context);
                    },
                    child: const Text('Sign up'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}