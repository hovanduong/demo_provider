import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({Key? key, required this.hinteText,required this.labelText,required this.controller}) : super(key: key);
  final hinteText;
  final  labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
  decoration:  InputDecoration(
    icon: const Icon(Icons.person),
    hintText: hinteText,
    labelText: labelText,
    
  ));
  
}
}