import 'package:assessment_task/model/answer_response.dart';
import 'package:assessment_task/server.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AnswerController extends GetxController {
  final int? id;

  AnswerController(this.id);
  @override
  void onInit() {
    getAnswer(id!);
    super.onInit();
  }

  AnswerResponse? answerResponse;
  bool isAnswerLoading = false;
  List<AnswerItems> answerItems = [];
  ApiService apiService = ApiService();
  Future<void> getAnswer(int id) async {
    try {
      isAnswerLoading = true;
      final response = await apiService.getAnswersResponse(id);
      answerResponse = response;
      answerItems.addAll(response?.items ?? []);
      print(".....${response?.quotaRemaining}");
    } catch (e) {
      print(e);
    } finally {
      isAnswerLoading = false;
      update();
    }
  }
}
