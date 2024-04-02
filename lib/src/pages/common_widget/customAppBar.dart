import 'package:flutter/material.dart';
import '../../config/custom_colors.dart';

class CustomAppBar extends StatelessWidget {
  String name;
  String image;
 Function() callPhone;
  CustomAppBar({
    Key? key,
    required this.name,
    required this.image,
    required this.callPhone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      automaticallyImplyLeading : false,
        backgroundColor: CustomColors.customBlueColor,
        title: Row(
          children: [
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.grey,
              backgroundImage:AssetImage(image)
            ),
            Padding(padding: EdgeInsets.only(left:8),
            child: Text(name, style: TextStyle(color: Colors.white, fontSize: 17)),
            )
          ],
          ),
          actions: [
            IconButton(onPressed: callPhone, icon: Icon(Icons.phone, size: 35,color: Colors.white,))
          ],
      );
  }
}
