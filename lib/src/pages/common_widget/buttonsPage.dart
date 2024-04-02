import 'package:flutter/material.dart';

class ButonsPage extends StatelessWidget{
  final texto;
  final ontap;

   const ButonsPage({super.key, required this.texto, required this.ontap, });
  @override
  Widget build(BuildContext context)
  {
    return  

      Container(
        width:300,
        height:60,
        decoration: BoxDecoration(
          color:const Color(0xfff5c3081),
          
          //color:Color(0x5c3081),
          borderRadius: BorderRadius.circular(15),
          
        ),
        child: Material(
          elevation: 7,
          color: const Color(0xfff5c3081),
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: ontap,
            child:Center(child: Text(texto,style:const TextStyle(fontSize:18,color:Colors.white))
            
          ),
          ),
        ),
      );

  }
}