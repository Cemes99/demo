import 'package:demo/constants.dart';
import 'package:demo/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fitWidth,
          ),

          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.person),

                ),
                // Text(DatabaseHelper.instance.get)
              ],
            )
          ),

          ListView(
            children: [
              TextButton(
                onPressed: () {

                },
                child: const Text('Sửa thông tin người dùng'),
              ),
              TextButton(
                onPressed: () {

                },
                child: const Text('Đăng xuất'),
              ),
            ],
          ),
        ],
      ),
    );
  }

}