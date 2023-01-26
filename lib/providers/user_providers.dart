import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api_portfolio/constants/api_constants.dart';
import 'package:github_api_portfolio/models/user_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

final userProvider = FutureProvider<UserModel?>((ref) async {
  Uri url = Uri.parse(ApiConstants.myself);

  final response = await get(url);

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    return UserModel.fromJson(responseJson);
  } else {
    return null;
  }
});
