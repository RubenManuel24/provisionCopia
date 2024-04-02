import 'package:flutter/material.dart';

class HeaderComponent {

  appBar(String text) {
    return AppBar(iconTheme: const IconThemeData(color: Colors.black,),
        backgroundColor: Colors.white,//const Color(0xfff5c3081),
        
        title: Center(child: Text(text, style: const TextStyle(color: Colors.white), textAlign: TextAlign.center,)),
      );
  }
}