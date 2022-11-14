import 'package:flutter/material.dart';
import 'package:flutter_assessment/main.dart';
import 'package:flutter_assessment/tag.dart';
import 'package:flutter_assessment/task.dart';
import 'package:flutter_assessment/task_list.dart';

class TaskListWidget extends StatefulWidget {
  TaskListWidget({Key? key,required this.tasks}) : super(key: key);
  final List<TaskList> tasks;
  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  List<Tag> tags = [tag0,tag1,tag2];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.tasks.length,
          itemBuilder: (BuildContext context, int index){
            return  Theme(
              data: Theme.of(context)
                  .copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                textColor: Colors.black,
                iconColor: Colors.black,
                initiallyExpanded: true,
                maintainState: false,
                childrenPadding: EdgeInsets.zero,
                collapsedIconColor: Colors.black,
                leading: Container(
                  child: Text(widget.tasks[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                title: Container(),
                children: <Widget>[
                  for(int i = 0; i < widget.tasks[index].tasks.length; i++)
                    ListTile(
                      contentPadding:  EdgeInsets.zero,
                      leading: Checkbox(
                          activeColor:Colors.black,
                          value: widget.tasks[index].tasks[i].isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.tasks[index].tasks[i].isSelected = !widget.tasks[index].tasks[i].isSelected;
                            });
                          }
                      ),
                      title: Container(
                        child: Text(widget.tasks[index].tasks[i].title,
                          style: TextStyle(fontWeight: FontWeight.bold),),
                      ),

                      onTap: (){

                      },
                    ),
                ],
              ),
            );
          }),
    );
  }
}
