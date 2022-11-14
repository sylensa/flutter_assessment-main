import 'package:flutter/material.dart';
import 'package:flutter_assessment/main.dart';
import 'package:flutter_assessment/tag.dart';
import 'package:flutter_assessment/task.dart';

class DuedateWidget extends StatefulWidget {
  DuedateWidget({Key? key,required this.listTasks}) : super(key: key);
  List<Task> listTasks ;
  @override
  State<DuedateWidget> createState() => _DuedateWidgetState();
}

class _DuedateWidgetState extends State<DuedateWidget> {
  List dueDates = [
    {
      "name" : "Overdue",
      "date": yesterday,
    },
    {
      "name" : "Today",
      "date": today,
    },
    {
      "name" : "Tomorrow",
      "date": tomorrow,
    },
    {
      "name" : "Later",
      "date": later,
    },
    {
      "name" : "No due date",
      "date": null,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: dueDates.length,
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
                  child: Text(dueDates[index]["name"],
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                title: Container(),
                children: <Widget>[
                  for(int t = 0; t < widget.listTasks.length; t++)
                    if(widget.listTasks[t].dueDate == null && index == 4)
                      ListTile(
                        contentPadding:  EdgeInsets.zero,
                        leading: Checkbox(
                            activeColor:Colors.black,
                            value: widget.listTasks[t].isSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.listTasks[t].isSelected = !widget.listTasks[t].isSelected;
                              });
                            }
                        ),
                        title: Container(
                          child: Text(widget.listTasks[t].title,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                        onTap: (){

                        },
                      )
                    else if(widget.listTasks[t].dueDate == dueDates[index]["date"])
                      ListTile(
                        contentPadding:  EdgeInsets.zero,
                        leading: Checkbox(
                            activeColor:Colors.black,
                            value: widget.listTasks[t].isSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.listTasks[t].isSelected = !widget.listTasks[t].isSelected;
                              });
                            }
                        ),
                        title: Container(
                          child: Text(widget.listTasks[t].title,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                        onTap: (){

                        },
                      )

                ],
              ),
            );
          }),
    );
  }
}
