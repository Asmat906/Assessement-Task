import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home_controller.dart';
import 'model/home_response.dart';

void main() {
  runApp(const Mod1());
}

class Mod1 extends StatelessWidget {
  const Mod1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("All Questions"),
              centerTitle: true,
            ),
            body: Column(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                        (scrollInfo.metrics.maxScrollExtent)) {
                      controller.getResponse();
                    }
                    return false;
                  },
                  child: Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      separatorBuilder: ((context, index) {
                        return const SizedBox(
                          height: 3,
                        );
                      }),
                      itemCount: controller.items.length,
                      itemBuilder: ((context, index) {
                        return Material(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                          child: ListTile(
                            onTap: () {
                              Get.to(
                                AnswerScreen(
                                  homeResponse: controller.items[index],
                                ),
                              );
                            },
                            title: Text(
                              controller.items[index].title.toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                controller.isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.blueAccent,
                      )
                    : const SizedBox()
              ],
            ),
          );
        });
  }
}

class AnswerScreen extends StatelessWidget {
  final Items? homeResponse;
  const AnswerScreen({this.homeResponse,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Question Details Screen"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ClipOval(
                child: Image.network(
                  homeResponse?.owner?.profileImage ?? "",
                  height: 80,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              homeResponse?.owner?.displayName ?? "",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              homeResponse?.owner?.accountId.toString() ?? "",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(homeResponse?.owner?.userType ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Colors.blue)),
                    const SizedBox(
              height: 15,
            ),
            Text(homeResponse?.owner?.link ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Colors.blue)),
          ],
        ));
  }
}
