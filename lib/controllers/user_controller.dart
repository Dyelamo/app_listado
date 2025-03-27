


import 'package:app_listado/models/users_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  
  final Apiservice apiService = Apiservice();

  var isLoading = true.obs;
  var userList = <UsersModel>[].obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;

  
}