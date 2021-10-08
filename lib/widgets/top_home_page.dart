import 'package:flutter/material.dart';
import 'package:demo/constants.dart';

class HomeTopWidget extends StatelessWidget
{
  const HomeTopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.notifications, color: mainColor,),
            onPressed: (){},
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }

}