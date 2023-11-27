import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserChatListScreen extends StatefulWidget {
  const UserChatListScreen({Key? key}) : super(key: key);

  @override
  State<UserChatListScreen> createState() => UserChatListState();
}

class UserChatListState extends State<UserChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes discussons'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(
                  radius: 23,
                ),
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("data"),
                    Text("data",
                        style: TextStyle(
                            fontSize: 13, fontStyle: FontStyle.normal))
                  ],
                ),
                subtitle: SizedBox(
                    width: Get.width, child: const Text('essai sqdddddd')),
              )),
    );
  }
}
