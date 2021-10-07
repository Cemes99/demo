import 'package:demo/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:demo/constants.dart';

import 'package:demo/screen/main_screen.dart';
import './signup_page.dart';

import 'package:demo/database/database.dart';
import 'package:demo/models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();

  String _username = '';
  String _password = '';
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
          if(value.length >= 6 && value.length <= 15) {
            bool done = true;
            for(String x in inValidChar) {
              if(value.contains(x)) {
                done = false;
                break;
              }
            }

            if(done) removeError(error: userInvalid);
          }
          _username = value;
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: userNullError);
        } else {
          if(value.length < 6 || value.length > 15) {
            addError(error: userInvalid);
          } else {
            for(String x in inValidChar) {
              if(value.contains(x)) {
                addError(error: userInvalid);
                break;
              }
            }
          }
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
          if(value.length >= 6 && value.length <= 15) {
            removeError(error: passInvalid);
          }
          _password = value;
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: passNullError);
        } else if (value.length < 6 || value.length > 15) {
          addError(error: passInvalid);
        }
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

  Future<bool> isValid() async {
    User user = await DatabaseHelper.instance.getUser(_username);
    if(_username == user.username && _password == user.password) return true;

    if(errors.isEmpty) {
      addError(error: wrongUserOrPass);
    } else if(errors.contains(wrongUserOrPass)) {
      removeError(error: wrongUserOrPass);
    }

    return false;
  }

  Widget errorsText(String? s) {
    if(s != null) return Text(s);
    return const Text('');
  }

  @override
  Widget build(BuildContext context) {
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
              space,
              _passwordField(),
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

                  if(await isValid()) {
                    Food.initFood();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MainScreen())
                    );
                  }
                  DatabaseHelper.instance.dropAll();
                  // DatabaseHelper.instance.delete();

                },
                child: const Text(
                  '    Login    ',
                  style: TextStyle(color: mainTextColor),
                ),
              ),
              space,
              Row(
                children: [
                  const Text(' Don\'t have account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const SignUpPage())
                      );
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