import 'package:flutter/material.dart';

class ItemList {
  Widget formatBorder({required String title,  Icon? iconLeading, IconButton? iconTrailing, onTap}) {
    //return Container(child: ListTile(title: Text("Ola"),));
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 65, 34, 91),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4,),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: iconLeading,
        trailing: iconTrailing
      )
     
    );
  }
}
