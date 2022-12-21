import 'package:assessment_task/model/home_response.dart';
import 'package:assessment_task/server.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getResponse();
    super.onInit();
  }

  int currentPage = 0;
  bool isLoading = false;
  bool isFetching = false;
  bool isAnswerLoading = false;
  List<Items> items = [];
  List<dynamic> answerItems = [];
  ApiService apiService = ApiService();
  HomeResponse? homeResponse;
  Future<void> getResponse() async {
    if (isFetching || 24 <= currentPage) return;

    try {
      isLoading = true;
      if (currentPage > 1) {
        isFetching = true;
      }
      update();
      currentPage += 1;
      final response = await apiService.getHomeResponse(currentPage);

      if (response != null) {
        print("current $currentPage");

        homeResponse = response;
        items.addAll(response.items ?? []);
        print("list length ... ${items.length}");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading = false;
      isFetching = false;
      update();
    }
  }
}
