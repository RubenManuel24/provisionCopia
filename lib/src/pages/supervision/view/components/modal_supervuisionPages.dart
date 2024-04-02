import "package:flutter/material.dart";

class ModalPages extends StatelessWidget {
  final String texto;
  final String icon;
  final Color color;
  final active;
  final Function() onTap;

  //final String textoModal;

  ModalPages({
    Key? key,
    required this.texto,
    required this.icon,
    this.color = Colors.grey,
    required this.onTap,
    this.active = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: active ? onTap : null,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              width: 73,
              height: 73,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Image.asset(
                icon,
                height: 50,
                width: 50,
                color: active ? Colors.black : Colors.black.withOpacity(0.5),
              )),
          Container(
              width: 73,
              height: 20,
              decoration: BoxDecoration(
                  color: active ? Colors.grey : Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Text(texto,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 10,
                      color:
                          active ? Colors.black : Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
