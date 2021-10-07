import 'dart:io';

import 'package:demo/models/food_model.dart';
import 'package:demo/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static const String dbName = "food_dev.db";

  static const String tableUser = "USER";
  static const String tableFood = "FOOD";
  static const String tableCart = "CART";

  static const String createTableUser = "CREATE TABLE " + tableUser
    + "(username text, password text, name nvarchar(50), address nvarchar(150), logged int)";

  static const String createTableFood = "CREATE TABLE " + tableFood
      + "(id text, name nvarchar(50), imagePath nchar(60), category nchar(30),"
      + " price int, shop nchar(50), carted int, loved int)";

  // static const String createTableCart = "CREATE TABLE" + tableCart
  //     + "(foodId text)";

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async => _database ??= await _initDB();

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(createTableUser);
    await db.execute(createTableFood);
    // await db.execute(createTableCart);
  }

  Future<User> getUser(String username) async {
    Database db = await instance.database;
    var user = await db.query(tableUser, orderBy: 'username');

    if (user.isNotEmpty) {
      List<User> list = user.map((e) => User.fromMap(e)).toList();

      for(var x in list) {

        if(x.username == username) return x;
      }
      return User(username: '');
    }
    return User(username: '');
  }

  Future<void> dropAll() async {
    Database db = await instance.database;
    // await db.delete(tableUser);
    await db.delete(tableFood);
    // await db.delete(tableCart);
  }

  Future<int> addUser(User user) async {
    Database db = await instance.database;
    return await db.insert(tableUser, user.toMap());
  }

  Future<int> addFoodToCart(Food food) async {
    Database db = await instance.database;
    return db.update(tableFood, food.toMap(), where: 'id = ?', whereArgs: [food.id]);
  }

  Future<int> delete() async {
    Database db = await instance.database;
    return await db.delete(tableUser);
  }

  Future<int> addFoodToFood(Food food) async {
    Database db = await instance.database;
    return await db.insert(tableFood, food.toMap());
  }

  // Future<int> addFoodToCart(Food food) async {
  //   Database db = await instance.database;
  //   return db.update(tableFood, food.toMap(), where: 'id = ?', whereArgs: [food.id]);
  // }

  Future<int> addFoodToFavorite(Food food) async {
    Database db = await instance.database;
    return db.update(tableFood, food.toMap(), where: 'id = ?', whereArgs: [food.id]);
  }

  Future<int> clearCart() async {
    Database db = await instance.database;
    var foods = await db.query(tableFood);

    if(foods.isNotEmpty) {
      List<Food> list = foods.map((e) => Food.fromMap(e)).toList();
      for(Food x in list) {
        if(x.id != '' && x.carted == 1) {
          x.carted = 0;
          addFoodToCart(x);
        }
      }
    }

    return 0;
  }

  Future<List<Food>> getFood() async {
    Database db = await instance.database;
    var foods = await db.query(tableFood);

    if(foods.isNotEmpty) {
      List<Food> list = foods.map((e) => Food.fromMap(e)).toList();

      return list;
    }

    return [];
  }

  Future<Food> getFoodById(String id) async {
    Database db = await instance.database;
    var foods = await db.query(tableFood);

    if(foods.isNotEmpty) {
      List<Food> list = foods.map((e) => Food.fromMap(e)).toList();
      for(var x in list) {

        if(x.id == id) return x;
      }

      return Food(id: '');
    }

    return Food(id: '');
  }

  Future<Food> getFoodFromCart() async {
    Database db = await instance.database;
    var foods = await db.query(tableFood);

    if(foods.isNotEmpty) {
      List<Food> list = foods.map((e) => Food.fromMap(e)).toList();
      for(var x in list) {

        if(x.carted == 1) return x;
      }

      return Food(id: '');
    }

    return Food(id: '');
  }

  Future<Food> getFoodFromFavorite() async {
    Database db = await instance.database;
    var foods = await db.query(tableFood);

    if(foods.isNotEmpty) {
      List<Food> list = foods.map((e) => Food.fromMap(e)).toList();
      for(var x in list) {

        if(x.loved == 1) return x;
      }

      return Food(id: '');
    }

    return Food(id: '');
  }
}