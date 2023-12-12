import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sipayu/models/menu_model/data_menu.dart';
import 'package:sipayu/models/menu_model/menu_model.dart';

class HomeServices {
  static Future<({List<DataMenu>? menus, String? error})> getMenu() async {
    var data =
        await rootBundle.loadString("assets/dummy_data/menu_response.json");

    MenuModel menus = MenuModel.fromJson(jsonDecode(data));

    return (
      menus: menus.data,
      error: null,
    );
  }
}
