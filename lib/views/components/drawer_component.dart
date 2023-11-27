import 'dart:io';
import 'package:ecommerce_app_firebase/controller/helper_classes/firebase_firestore_helper.dart';
import 'package:ecommerce_app_firebase/views/components/drawer_component_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_ios/image_picker_ios.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/resources.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  State<DrawerComponent> createState() => DrawerComponentState();
}

class DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var img =
          await ImagePickerIOS().getImageFromSource(source: ImageSource.camera);
      if (img == null) return;
      final ImageTemp = File(img.path);
      setState(() {
        img = ImageTemp as XFile?;
      });
    }

    Reference refImg;
    String imageUrl = '';
    getimg() async {
      ImagePicker imagePicker = ImagePicker();
      XFile? myImage = await imagePicker.pickImage(source: ImageSource.gallery);

      String tempFile = person!.email ?? myImage!.path;
      //initialize FirebaseStorage
      Reference reference = FirebaseStorage.instance.ref();
      //create folder in FirebaseStorage
      Reference refRoot = reference.child('clients');
      // now upload image in Folder
      refImg = refRoot.child(tempFile);
      //putting file in image
      refImg.putFile(File(myImage!.path));

      imageUrl = await refImg.getDownloadURL();
      Map<String, dynamic> tempp = {
        'name': tempFile,
        'image': imageUrl,
      };
      FireBaseStoreHelper.fireBaseStoreHelper.imageInsert(data: tempp);
    }

    return Drawer(
      child: Builder(builder: (context) {
        return Column(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  color: Colors.red.shade200,
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/logo/user.png'),
                          radius: 50,
                          backgroundColor: Colors.blue,
                        ),
                        // StreamBuilder(
                        //   stream: FireBaseStoreHelper.db
                        //       .collection("UserImage")
                        //       .snapshots(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasError) {
                        //       return Stack(
                        //         alignment: Alignment.bottomRight,
                        //         children: [
                        //           const CircleAvatar(
                        //             backgroundImage: AssetImage(
                        //                 'assets/images/logo/user.png'),
                        //             radius: 50,
                        //             backgroundColor: Colors.blue,
                        //           ),
                        //           Container(
                        //             height: 40,
                        //             width: 40,
                        //             child: ElevatedButton(
                        //                 style: ButtonStyle(
                        //                     backgroundColor:
                        //                         MaterialStateProperty.all(
                        //                   Colors.red.shade300,
                        //                 )),
                        //                 onPressed: getimg,
                        //                 child: Container(
                        //                   alignment: Alignment.center,
                        //                   child: const Icon(
                        //                     Icons.add,
                        //                     color: Colors.white,
                        //                     size: 10,
                        //                   ),
                        //                 )),
                        //           ),
                        //         ],
                        //       );
                        //     } else if (snapshot.hasData) {
                        //       QuerySnapshot<Map<String, dynamic>>? favourite =
                        //           snapshot.data;
                        //       List<QueryDocumentSnapshot<Map<String, dynamic>>>
                        //           imgs = favourite!.docs;
                        //       if (imgs.isEmpty) {
                        //         return Stack(
                        //           alignment: Alignment.bottomRight,
                        //           children: [
                        //             const CircleAvatar(
                        //               backgroundImage: AssetImage(
                        //                   'assets/images/logo/user.png'),
                        //               radius: 50,
                        //               backgroundColor: Colors.blue,
                        //             ),
                        //             Container(
                        //               height: 40,
                        //               width: 40,
                        //               child: ElevatedButton(
                        //                   style: ButtonStyle(
                        //                       backgroundColor:
                        //                           MaterialStateProperty.all(
                        //                     Colors.red.shade300,
                        //                   )),
                        //                   onPressed: getimg,
                        //                   child: Container(
                        //                     alignment: Alignment.center,
                        //                     child: const Icon(
                        //                       Icons.add,
                        //                       color: Colors.white,
                        //                       size: 10,
                        //                     ),
                        //                   )),
                        //             ),
                        //           ],
                        //         );
                        //       } else {
                        //         return Stack(
                        //           alignment: Alignment.bottomRight,
                        //           children: [
                        //             CircleAvatar(
                        //               backgroundImage:
                        //                   NetworkImage('${imgs[0]['image']}'),
                        //               radius: 50,
                        //               backgroundColor: Colors.blue,
                        //             ),
                        //           ],
                        //         );
                        //       }
                        //     }
                        //     return Stack(
                        //       alignment: Alignment.bottomRight,
                        //       children: [
                        //         const CircleAvatar(
                        //           backgroundImage:
                        //               AssetImage('assets/images/logo/user.png'),
                        //           radius: 50,
                        //           backgroundColor: Colors.blue,
                        //         ),
                        //         Container(
                        //           height: 40,
                        //           width: 40,
                        //           child: ElevatedButton(
                        //               style: ButtonStyle(
                        //                   backgroundColor:
                        //                       MaterialStateProperty.all(
                        //                 Colors.red.shade300,
                        //               )),
                        //               onPressed: getimg,
                        //               child: Container(
                        //                 alignment: Alignment.center,
                        //                 child: const Icon(
                        //                   Icons.add,
                        //                   color: Colors.white,
                        //                   size: 10,
                        //                 ),
                        //               )),
                        //         ),
                        //       ],
                        //     );
                        //   },
                        // ),

                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Bienvenue Moji', // (person!.email == null) ? '' : '${person!.email} ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Derniere lecture le 01.03.3004 13h:333min',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 10,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      DrawerComponentItem.drawerItem(
                          context, 'Profil', Icons.person),
                      DrawerComponentItem.drawerItem(
                          context, 'Mon Blog', Icons.travel_explore),
                      const SizedBox(
                        width: 20,
                      ),
                      DrawerComponentItem.drawerItem(
                          context, 'Mes telechargements', Icons.download),
                      DrawerComponentItem.drawerItem(
                          context, 'Reglages', Icons.settings),
                      DrawerComponentItem.drawerItem(
                          context, 'Aide', Icons.help),
                      DrawerComponentItem.drawerItem(
                          context, 'Deconnection', Icons.logout)
                    ],
                  ),
                )),
          ],
        );
      }),
    );
  }
}
