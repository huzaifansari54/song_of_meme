import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:song_of_meme/src/features/auth/data/model/auth_model.dart';

class LocalDataSource extends ILocalDataSorce {
  final SharedPreferences _db;
  static const token = "token";
  static const user = "user";
  LocalDataSource({required SharedPreferences db}) : _db = db;

  @override
  Future<AuthModel> saveUser(AuthModel user) async {
    final userStringfy = json.encode(user.toJson());
    await _db.setString(LocalDataSource.token, user.id);
    await _db.setString(LocalDataSource.user, userStringfy);
    return user;
  }

  @override
  String getUserToken() {
    return _db.getString(LocalDataSource.token) ?? "";
  }

  @override
  void deleteToken() async {
    await _db.remove(LocalDataSource.token);
  }

  @override
  AuthModel getUser() {
    try {
      final stringyUser = _db.getString(LocalDataSource.user);
      if (stringyUser == null) {
        return AuthModel.empty();
      }
      final user = AuthModel.fromJson(json.decode(stringyUser));
      return user;
    } catch (_) {
      return AuthModel.empty();
    }
  }
}

abstract class ILocalDataSorce {
  Future<AuthModel> saveUser(AuthModel user);
  String getUserToken();
  AuthModel getUser();
  void deleteToken();
}
