import 'package:flutter/material.dart';

class ModalHistory extends StatelessWidget {
  final String texto;
  final String icon;
  final Function() onTap;

  //final String textoModal;

  ModalHistory({
    Key? key,
    required this.texto,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: 73,
              height: 73,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Image.asset(
                icon,
                height: 50,
                width: 50,
                color: Colors.black
              )),
          Container(
              width: 73,
              height: 20,
              decoration: BoxDecoration(
                  color:Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      color:Colors.black,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
