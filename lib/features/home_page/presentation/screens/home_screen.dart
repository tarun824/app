import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_app/features/home_page/model/task.dart';
import 'package:task_app/remote/task_data/data_base.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String id = "";
  String title = "";
  String description = "";
  bool completed = false;

  bool isLoading = true;
  List<Task> allTask = [];
  void fetch() async {
    final addTask = [
      Task(
          id: "id",
          title: "title",
          description: "description",
          completed: false),
      Task(
          id: "id1",
          title: "title1",
          description: "description1",
          completed: false),
    ];
    await DataBaseLocal().insertTask(addTask);
    allTask = await DataBaseLocal().retrieveTask();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task App"),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8),
                          child: Column(
                            children: [
                              Text("Enter Task Details"),
                              TextField(
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(hintText: "ID"),
                                onChanged: (value) {
                                  id = value;
                                },
                              ),
                              TextField(
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(hintText: "Title"),
                                onChanged: (value) {
                                  title = value;
                                },
                              ),
                              TextField(
                                textInputAction: TextInputAction.next,
                                decoration:
                                    InputDecoration(hintText: "description"),
                                onChanged: (value) {
                                  description = value;
                                },
                              ),
                              TextField(
                                textInputAction: TextInputAction.next,
                                decoration:
                                    InputDecoration(hintText: "Completed"),
                                onChanged: (value) {
                                  completed = bool.parse(value);
                                },
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    DataBaseLocal().insertTask([
                                      Task(
                                          id: id,
                                          title: title,
                                          description: description)
                                    ]);
                                  },
                                  child: Text("Submit"))
                            ],
                          ),
                        );
                      });
                },
                icon: Icon(CupertinoIcons.add))
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: allTask.length,
                        itemBuilder: (BuildContext, index) {
                          return ListTile(
                            leading: Checkbox(
                              value: allTask[index].completed,
                              onChanged: (boolValue) {
                                allTask[index].completed =
                                    bool.parse(boolValue.toString());
                                setState(() {});
                              },
                            ),
                            title: Text(
                              allTask[index].title,
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: IconButton(
                                  icon: const Icon(CupertinoIcons.delete),
                                  onPressed: () async {
                                    await DataBaseLocal()
                                        .deleteTask(allTask[index].id);
                                    allTask.removeAt(index);
                                    setState(() {});
                                  },
                                )),
                          );
                        }),
                  ),
                ],
              ));
  }
}
