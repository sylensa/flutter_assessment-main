import 'package:flutter/material.dart';
import 'package:flutter_assessment/main.dart';
import 'package:flutter_assessment/tag.dart';
import 'package:flutter_assessment/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({Key? key,required this.listTasks}) : super(key: key);
  List<Task> listTasks ;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  List<Tag> tags = [tag0,tag1,tag2];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.listTasks.length,
          itemBuilder: (BuildContext context, int index){
            return    ListTile(
              contentPadding:  EdgeInsets.zero,
              leading: Checkbox(
                  activeColor:Colors.black,
                  value: widget.listTasks[index].isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.listTasks[index].isSelected = !widget.listTasks[index].isSelected;
                    });
                  }
              ),
              title: Container(
                child: Text(widget.listTasks[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),),
              ),

              onTap: (){

              },
            );
          }),
    );
  }
}
