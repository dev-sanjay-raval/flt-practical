import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_genious/Controller/user_list_controller.dart';
import 'package:i_genious/Helper/theme.dart';
import 'package:i_genious/UI/user_detail_screen.dart';
import 'package:i_genious/WIdgets/row_widget.dart';

class UserListScreen extends StatelessWidget {
  UserListScreen({super.key});

  UserListController controller = Get.put(UserListController());

  @override
  Widget build(BuildContext context) {
    return GetX<UserListController>(
      init: controller,
      initState: (_) {
        controller.getUserData();
        controller.getMarkers(context: context);
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.title.value),
            centerTitle: true,
          ),
          body: controller.userData.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.userData.length,
                  itemBuilder: (context, index) {
                    var item = controller.userData[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UserDetailScreen(userData: item);
                        }));
                      },
                      child: Container(
                        color: Themes.primaryColor.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Themes.primaryColor.shade300,
                            elevation: 2.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              child: Column(
                                children: [
                                  RowWidget(
                                      title: "Name", labelName: item.name),
                                  const SizedBox(height: 10),
                                  RowWidget(
                                      title: "City/state",
                                      labelName: item.city),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(color: Themes.primaryColor)),
        );
      },
    );
  }
}
