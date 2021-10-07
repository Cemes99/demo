class User {
  final String? username;
  final String? password;
  final String name = '';
  final String address = '';
  final String phoneNumber = '';

  User({this.username, this.password});

  factory User.fromMap(Map<String, dynamic> m) => User(
    username: m['username'],
    password: m['password']
  );
  
  Map<String, dynamic> toMap() {
    return {
      'username': username!,
      'password': password!
    };
  }


}