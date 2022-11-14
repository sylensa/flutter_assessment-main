import 'package:flutter/material.dart';
import 'package:flutter_assessment/task.dart';
import 'package:flutter_assessment/widgets/duedate_widget.dart';
import 'package:flutter_assessment/widgets/tag_widget.dart';
import 'package:flutter_assessment/widgets/task_widget.dart';
import 'package:flutter_assessment/widgets/taskliist_widget.dart';

import 'task_list.dart';

// TODO: Create a Widget that displays a list of tasks in different ways.
class MyTasks extends StatefulWidget {
  const MyTasks({Key? key, required this.tasks}) : super(key: key);

  final List<TaskList> tasks;

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  List<Task> listTasks = [];
  List filterList = ["None","Due Date","Task List","Tag"];
  int currentPage = 0;
  Map<String, Widget> getPage() {
    switch (currentPage) {
      case 0:
        return {'None': TaskWidget(listTasks: listTasks,)};
      case 1:
        return {'Due Date': DuedateWidget(listTasks: listTasks,)};

      case 2:
        return {'Task List': TaskListWidget(tasks: widget.tasks,)};

      case 3:
        return {'Tag': TagWidget(listTasks: listTasks,)};

    }
    return {'': Container()};
  }

  filterActionsModalBottomSheet(context,) {
    double sheetHeight = 400;
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
              return Container(
                  height: sheetHeight,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.grey,
                        height: 5,
                        width: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                            child: Text("Filter Actions",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Expanded(
                          child: ListView.builder(
                              itemCount: filterList.length,
                              itemBuilder: (BuildContext context, int index){
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      currentPage = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(filterList[index], style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                        if(currentPage == index)
                                          Icon(Icons.check,color: Colors.green,)
                                      ],
                                    ),
                                  ),
                                );
                              })
                      ),
                    ],
                  ));
            },
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < widget.tasks.length; i++){
      for(int t = 0; t < widget.tasks[i].tasks.length; t++){
        listTasks.add(widget.tasks[i].tasks[t]);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: Container(
        child:    Column(
          children: [
            getPage().values.first
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          filterActionsModalBottomSheet(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.filter_list),
      ),
    );
  }
}
