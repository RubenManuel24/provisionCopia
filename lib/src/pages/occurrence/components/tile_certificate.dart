import 'package:flutter/material.dart';

class TileCertificate extends StatelessWidget {
  String image;

   TileCertificate({
    Key? key,
    required this.image,
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return  SizedBox(
            height: 200,
            width: 200,
           child: Image.asset(image, fit: BoxFit.cover,)

      
       );
  }
}
