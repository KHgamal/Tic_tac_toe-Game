import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.marginNum, required this.onTap, required this.backgroundColor, required this.label, required this.width, required this.height}) : super(key: key);
  final double marginNum;
   final double width;
   final double height;
  final VoidCallback onTap;
  final Color backgroundColor;
  final  dynamic label;
  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.all(marginNum),
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed:onTap,
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll<
                  Color>(backgroundColor),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30),
                  )
              )
          ),
          child:label,
        )
    );
  }
}
