import 'package:flutter/material.dart';

import 'package:demo/controller/signup_page_controller.dart';

import 'package:demo/constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpState();

}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';
  String _rePassword = '';

  SignUpController controller = SignUpController();

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

  Widget _rePasswordField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) _rePassword = value;
      },
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          labelText: 'Re-Password',
          hintText: 'Re-enter your password',
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
          'Register Account',
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
              _rePasswordField(),
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
                  if(_formKey.currentState!.validate()) _formKey.currentState!.save();
                  if(await controller.isValid(_username, _password, _rePassword)) {
                    controller.callLogin(context);
                  }
                },
                child: const Text(
                  '    Register    ',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}