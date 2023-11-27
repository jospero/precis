import 'package:flutter/material.dart';

class DrawerComponentItem {
  static drawerItem(context, String name, IconData icon,
      {String pageLink = ''}) {
    return GestureDetector(
      onTap: pageLink.isEmpty
          ? null
          : () {
              Navigator.pop(context);
              Navigator.pushNamed(context, pageLink);
            },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
