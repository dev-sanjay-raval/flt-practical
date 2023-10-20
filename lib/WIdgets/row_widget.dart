import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  final String? title;
  final String? labelName;
  const RowWidget({super.key,this.title,this.labelName});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("$title : ",style: const TextStyle(fontWeight: FontWeight.bold),),
        Text(labelName ?? ""),
        const SizedBox(width: 10)
      ],
    );
  }
}
