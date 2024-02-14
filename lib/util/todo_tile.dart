import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
ToDoTile({
  super.key,
  required this.taskName,
  required this.isCompleted,
  required this.onChanged,
  required this.deleteFunction
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20 , right: 20, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor:Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Row(
            children: [
              Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
              ),
              Text(
                  taskName,
                style: TextStyle(decoration: isCompleted ? TextDecoration.lineThrough:TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.purple.shade200,
            borderRadius: BorderRadius.circular(15.0),
          ),
        
        ),
      ),

    );
  }
}
