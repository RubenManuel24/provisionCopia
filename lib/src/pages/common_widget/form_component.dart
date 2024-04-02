import 'package:flutter/material.dart';

class FormComponent {

  textFieldSearch(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      onChanged: (String text){},
      decoration: const InputDecoration(
        iconColor: Colors.white,
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
        
        labelText: "Pesquisar Tarefas",
        prefixIcon: Icon(Icons.search_outlined),
        border: InputBorder.none,
      ),
    );
  }
}