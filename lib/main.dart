import 'package:flutter/material.dart';
import 'package:to_to_app/padding.dart';
import 'package:to_to_app/todocard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppProject(), debugShowCheckedModeBanner: false);
  }
}

final myControlled = TextEditingController();

class Task {
  String title;
  bool status;
  Task({required this.title, required this.status});
}

String? text;

void getText() {
  text = myControlled.text;
}

List<Task> allTask = [
  Task(title: "Go To Gem", status: true),
  Task(title: "listen to quran", status: false),
  Task(title: "build the Flutter App", status: true),
  Task(title: "Coding", status: false),
];

List<Task> originList = [
  Task(title: "Go To Gem", status: true),
  Task(title: "listen to quran", status: false),
  Task(title: "build the Flutter App", status: true),
  Task(title: "Coding", status: false),
];

class AppProject extends StatefulWidget {
  const AppProject({super.key});

  @override
  State<AppProject> createState() => _AppProjectState();
}

int calcStatus() {
  int increment = 0;
  allTask.forEach((item) {
    if (item.status == true) {
      increment++;
    }
  });
  return increment;
}

class _AppProjectState extends State<AppProject> {
  @override
  void initState() {
    super.initState();
    myControlled.addListener(getText);
  }

  void refresh() {
    setState(() {
      allTask = List.from(originList);
    });
  }

  void changeStatus(int itemIndex) {
    setState(() {
      allTask[itemIndex].status = !allTask[itemIndex].status;
    });
  }

  void delete(int deleteItem) {
    setState(() {
      allTask.remove(allTask[deleteItem]);
    });
  }

  void deleteAll() {
    setState(() {
      allTask.clear();
    });
  }

  void addNewTask() {
    setState(() {
      allTask.add(Task(title: myControlled.text, status: false));
      myControlled.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Container(
                  width: 400,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      TextField(
                        maxLength: 20,
                        controller: myControlled,
                        decoration: InputDecoration(
                          hintText: "Add New Task",
                          hintStyle: TextStyle(color: Colors.grey[900]),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          addNewTask();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 56, 56, 56),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white, size: 35),
      ),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(
              Icons.delete,
              color: const Color.fromARGB(255, 255, 149, 141),
            ),
          ),
          IconButton(
            onPressed: () {
              refresh();
            },
            icon: Icon(Icons.refresh, color: Colors.white),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 61, 61, 61),
        title: Text(
          "To Do App",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          EditPadding(calcStatus: calcStatus),
          Expanded(
            child: ListView.builder(
              itemCount: allTask.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoCard(
                  title: allTask[index].title,
                  status: allTask[index].status,
                  index: index,
                  changeStatus: changeStatus,
                  delete: delete,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
