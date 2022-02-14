import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List taskList = [];
  List dateList = [];
  List timeList = [];

  TextEditingController taskController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tast Manager'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Task title'),
                subtitle: Text('date: 12/12/2022 10:00 PM'),
                leading: CircleAvatar(),
                trailing: Icon(Icons.check_box_outline_blank),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add your task'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: taskController,
                        decoration: const InputDecoration(
                          hintText: 'Add task here',
                          icon: Icon(Icons.title),
                        ),
                      ),
                      TextField(
                        controller: dateController,
                        decoration: const InputDecoration(
                            hintText: 'Task date',
                            icon: Icon(Icons.date_range)),
                      ),
                      TextField(
                        controller: timeController,
                        decoration: const InputDecoration(
                            hintText: 'Tast time', icon: Icon(Icons.timeline)),
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          taskList.add(taskController.text);
                          dateList.add(dateController.text);
                          timeList.add(timeController.text);

                          print(taskList);
                          print(dateList);
                          print(timeList);
                        },
                        child: const Text('Ok')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
