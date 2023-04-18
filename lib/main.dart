import 'package:flutter/material.dart';
import 'package:task_app/add_task_screen.dart';

void main(){
  runApp(MaterialApp(home: TaskApp()));
}

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks = [
      Task(title: 'Task 1', description: 'Description of task 1', dueDate: DateTime.now()),
      Task(title: 'Task 2', description: 'Description of task 2', dueDate: DateTime.now()),
      Task(title: 'Task 3', description: 'Description of task 3', dueDate: DateTime.now()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task App'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tasks[index].title),
            subtitle: Text(_tasks[index].description),
            trailing: Text("${_tasks[index].dueDate.day}/${_tasks[index].dueDate.month}/${_tasks[index].dueDate.year} ${_tasks[index].dueDate.hour}:${_tasks[index].dueDate.minute}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to the new screen
          final newTask = await Navigator.push<Task>(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );

          if (newTask != null) {
            setState(() {
              _tasks.add(newTask);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// Example task class
class Task {
  String title;
  String description;
  DateTime dueDate;

  Task({required this.title, required this.description, required this.dueDate});
}
