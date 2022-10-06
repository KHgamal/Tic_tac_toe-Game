import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.user, required this.label, required this.prefixIcon}) : super(key: key);
 final TextEditingController user ;
  final String label ;
  final Icon prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
           vertical: MediaQuery.of(context).size.height*0.04,
               horizontal: MediaQuery.of(context).size.height*0.03
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'field is required';
          }
          return null;
        },
        controller: user,
        decoration:  InputDecoration(
            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                //color of border
                borderSide: const BorderSide(
                  color: Colors.indigo ,
                )
            ) ,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: prefixIcon,
            hintStyle:const TextStyle(color: Colors.black),
            hintText: label,
            border: const OutlineInputBorder()
            ),

      ),
    );
  }
}
