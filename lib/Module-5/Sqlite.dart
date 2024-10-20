import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}

class Task {
  int? id;
  String name;
  String description;
  String date;
  String time;
  String priority;
  bool isCompleted;

  Task({
    this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date,
      'time': time,
      'priority': priority,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      date: map['date'],
      time: map['time'],
      priority: map['priority'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Database database;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  String _priority = 'Low';
  List<Task> _tasks = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'task_manager.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, date TEXT, time TEXT, priority TEXT, isCompleted INTEGER)',
        );
      },
      version: 1,
    );
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final List<Map<String, dynamic>> maps = await database.query('tasks');
    setState(() {
      _tasks = List.generate(maps.length, (i) {
        return Task.fromMap(maps[i]);
      });
    });
  }

  Future<void> _addTask() async {
    if (_nameController.text.isNotEmpty) {
      Task newTask = Task(
        name: _nameController.text,
        description: _descriptionController.text,
        date: _dateController.text,
        time: _timeController.text,
        priority: _priority,
      );
      await database.insert('tasks', newTask.toMap());
      _nameController.clear();
      _descriptionController.clear();
      _dateController.clear();
      _timeController.clear();
      _loadTasks();
    }
  }

  Future<void> _updateTask(Task task) async {
    await database.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
    _loadTasks();
  }

  Future<void> _deleteTask(int id) async {
    await database.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadTasks();
  }

  void _showContextMenu(BuildContext context, Task task) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0),
      items: [
        PopupMenuItem(
          value: 'complete',
          child: Text('Complete Task'),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text('Delete Task'),
        ),
      ],
    ).then((value) {
      if (value == 'complete') {
        task.isCompleted = true;
        _updateTask(task);
      } else if (value == 'delete') {
        _confirmDelete(task.id!);
      }
    });
  }

  void _confirmDelete(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Task'),
          content: Text('Are you sure you want to delete this task?'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                _deleteTask(id);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Task Name'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
                ),
                TextField(
                  controller: _timeController,
                  decoration: InputDecoration(labelText: 'Time (HH:MM)'),
                ),
                DropdownButton<String>(
                  value: _priority,
                  onChanged: (String? newValue) {
                    setState(() {
                      _priority = newValue!;
                    });
                  },
                  items: <String>['Low', 'Medium', 'High']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addTask();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _searchTasks(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredTasks = _tasks.where((task) {
      return task.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: TaskSearchDelegate(onQueryChanged: _searchTasks),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredTasks.length,
        itemBuilder: (context, index) {
          final task = filteredTasks[index];
          return GestureDetector(
            onLongPress: () => _showContextMenu(context, task),
            child: Card(
              color: task.isCompleted ? Colors.grey[300] : null,
              child: ListTile(
                title: Text(
                  task.name,
                  style: task.isCompleted
                      ? TextStyle(decoration: TextDecoration.lineThrough)
                      : null,
                ),
                subtitle: Text('${task.description}\n${task.date} ${task.time}'),
                tileColor: _getTaskColor(task),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  Color? _getTaskColor(Task task) {
    if (task.isCompleted) {
      return Colors.grey;
    }

    DateTime now = DateTime.now();
    DateTime taskDateTime = DateTime.parse('${task.date} ${task.time}');
    if (taskDateTime.isBefore(now)) {
      return Colors.blue; // Due tasks
    }

    switch (task.priority) {
      case 'High':
        return Colors.red; // High priority
      case 'Medium':
        return Colors.blue; // Average priority
      case 'Low':
        return Colors.green; // Low priority
      default:
        return null; // Default color
    }
  }
}

class TaskSearchDelegate extends SearchDelegate {
  final Function(String) onQueryChanged;

  TaskSearchDelegate({required this.onQueryChanged});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          onQueryChanged(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(); // Not used in this implementation
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    onQueryChanged(query);
    return Container(); // Not used in this implementation
  }
}
