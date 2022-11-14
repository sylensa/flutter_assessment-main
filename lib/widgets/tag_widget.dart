import 'package:flutter/material.dart';
import 'package:flutter_assessment/main.dart';
import 'package:flutter_assessment/tag.dart';
import 'package:flutter_assessment/task.dart';

class TagWidget extends StatefulWidget {
   TagWidget({Key? key,required this.listTasks}) : super(key: key);
    List<Task> listTasks ;
  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {
  List<Tag> tags = [tag0,tag1,tag2];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tags.length,
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
                  child: Text(tags[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                title: Container(),
                children: <Widget>[
                  for(int t = 0; t < widget.listTasks.length; t++)
                    if(widget.listTasks[t].tags.isEmpty && index == 0)
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
                    else if(widget.listTasks[t].tags.contains(tags[index]))
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
