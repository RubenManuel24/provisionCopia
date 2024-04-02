import 'package:flutter/material.dart';


class Env{
  Size sized(BuildContext context)
  {
      Size size =MediaQuery.of(context).size;
      return size;
  }
}
