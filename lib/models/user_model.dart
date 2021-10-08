import 'package:demo/data/user_data.dart';
import 'package:demo/database/database.dart';

class User {
  final String? username;
  final String? password;
  String? name = '';
  String? address = '';
  String? phoneNumber = '';
  int? online = 0;

  User({this.username, this.password, this.name,
    this.address, this.phoneNumber, this.online});

  factory User.fromMap(Map<String, dynamic> m) => User(
    username: m['username'],
    password: m['password'],
  );

  factory User.fromMapFull(Map<String, dynamic> m) => User(
    username: m['username'],
    password: m['password'],
    name: m['name'],
    address: m['address'],
    phoneNumber: m['phoneNumber'],
    online: m['online']
  );

  Map<String, dynamic> toMap() {
    return {
      'username': username!,
      'password': password!
    };
  }

  Map<String, dynamic> toMapFull() {
    return {
      'username': username!,
      'password': password!,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'online': online
    };
  }

  static void initUser() async {
    for(var x in users) {
      await DatabaseHelper.instance.addUser(x);
    }
  }
}