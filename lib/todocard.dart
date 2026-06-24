import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String title;
  final bool status;
  final Function changeStatus;
  final Function delete;
  final int index;
  const ToDoCard({
    super.key,
    required this.title,
    required this.status,
    required this.changeStatus,
    required this.index,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: GestureDetector(
        onTap: () {
          changeStatus(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(bottom: 10),
          width: 300,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  decoration: status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2.2,
                ),
              ),
              IconButton(
                onPressed: () {
                  delete(index);
                },
                icon: Icon(
                  status == true ? Icons.done : Icons.delete,
                  color: status
                      ? const Color.fromARGB(255, 7, 159, 12)
                      : Colors.red,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
