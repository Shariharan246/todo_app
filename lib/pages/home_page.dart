import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
@override
  void initState() {
       if(_mybox.get("TODOLIST") == null){
         db.createInitialData();
       }
       else{
         db.loadData();
       }
    super.initState();
  }
  final _controller = TextEditingController();
  void checkBoxChanged(bool? value, int index){
      setState(() {
        db.todo[index][1] = !db.todo[index][1];
      });
      db.updateDataBase();
  }
  void saveNewTask(){
    setState(() {
      db.todo.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  void createDialog(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel:() => Navigator.of(context).pop(),
          );
        },
    );
  }
  void deleteTask(int index){
    setState(() {
      db.todo.removeAt(index);
    });
    db.updateDataBase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Center(child: Text(
          "TO-DO",
          style: TextStyle(
            fontWeight:FontWeight.bold,
            fontSize: 25,
          ),
           ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createDialog,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.purple.shade200,
      ),
      body: ListView.builder(
        itemCount: db.todo.length,
        itemBuilder: (context, index){
          return ToDoTile(
              taskName: db.todo[index][0],
              isCompleted: db.todo[index][1],
              onChanged: (value) => checkBoxChanged(value,index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
