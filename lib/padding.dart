import 'package:flutter/material.dart';
import 'package:to_to_app/main.dart';

class EditPadding extends StatelessWidget {
  final int Function() calcStatus;
  const EditPadding({super.key, required this.calcStatus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        "${calcStatus()}/${allTask.length}",
        style: TextStyle(
          fontSize: 30,
          color: allTask.length == calcStatus() ? Colors.green : Colors.white,
        ),
      ),
    );
  }
}
