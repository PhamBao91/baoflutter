import 'dart:convert';

import 'package:advanced_provider/FutureProvider/user_model.dart';
import 'package:flutter/services.dart';

class LoadDataFromJson {
  final String _dataPath = "assets/info.json";
  List<User> users;

  // Load data, convert to List of Model
  Future<List<User>> loadUserData( ) async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(jsonUserData['users']).users;
    print('load thành công!' + jsonEncode(users));
    return users;
  }

  // Load Data from Assets
  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 10), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }
}