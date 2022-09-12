import 'dart:developer';

import 'package:cblaze_task/models/profile_model.dart';
import 'package:cblaze_task/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProfileDataControllerProvider extends ChangeNotifier {
  bool isLoading = true;

  ProfileModel? profileModel;

  getUserData() async {
    Response response = await ApiServices().getProfile();
    log(response.data.toString());
    if (response.statusCode == 200) {
      profileModel = ProfileModel.fromJson(response.data);
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      profileModel = null;
      notifyListeners();
    }
  }
}
