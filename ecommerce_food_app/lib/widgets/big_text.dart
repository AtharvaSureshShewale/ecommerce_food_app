import 'package:ecommerce_food_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText({
    super.key, 
    this.color=const Color(0xFF332d2b), 
    this.size=20,
    required this.text,
    this.overFlow=TextOverflow.ellipsis
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400,
        ),
      );
  }
}
