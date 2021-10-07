import 'package:demo/database/database.dart';
import 'package:demo/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:demo/constants.dart';
import 'package:demo/models/user_model.dart';

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

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  Widget _usernameField() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: userNullError);
          _username = value;
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: userNullError);
          _username = value;
        }
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
        if (value.isNotEmpty) {
          removeError(error: passNullError);
          _password = value;
        }
      },
      validator: (value) {
        if (value!.isEmpty) addError(error: passNullError);
        _password = value;
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
        if (value.isNotEmpty) {
          removeError(error: passNullError);
          _rePassword = value;
        }
      },
      validator: (value) {
        if (value!.isEmpty) addError(error: rePassNullError);
        _rePassword = value;
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
    // DatabaseReference database = FirebaseDatabase.instance.reference();
    
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
              space,
              _passwordField(),
              space,
              _rePasswordField(),
              space,
              Column(
                children: errors.map(errorsText).toList(),
              ),
              space,
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
                  if(_rePassword == _password) {
                    await DatabaseHelper.instance.addUser(User(username: _username, password: _password));

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LoginPage())
                    );
                  } else {
                    addError(error: rePassDiff);
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