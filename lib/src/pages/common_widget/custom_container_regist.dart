import 'package:flutter/material.dart';

class CustomContainerRegist extends StatelessWidget {
  double height;
  TextEditingController textEditingController;
   CustomContainerRegist({
    Key? key,
    required this.height,
    required this.textEditingController,
  }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Container(
                    height: height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: textEditingController,
                          maxLines: null,
                          showCursor: true,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Relate algo abaixo...',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              border: InputBorder.none),
                        ),
                      ),
                    ));
  }
}
