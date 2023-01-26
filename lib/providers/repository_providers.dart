import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_api_portfolio/constants/api_constants.dart';
import 'package:github_api_portfolio/models/repository_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

final repositoryProvider = FutureProvider<List<RepositoryModel>>((ref) async {
  Uri url = Uri.parse(ApiConstants.repos);

  final response = await get(url);

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    return List<RepositoryModel>.from(
        responseJson.map((x) => RepositoryModel.fromJson(x)));
  } else {
    return [];
  }
});
