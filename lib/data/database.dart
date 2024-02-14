import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todo =[];
  final _mybox = Hive.box('mybox');
  void createInitialData(){
    todo = [
      ["Make new Note",false],
      ["Start Making!...",false],
    ];
  }

  void loadData(){
    todo = _mybox.get("TODOLIST");
  }

  void updateDataBase(){
    _mybox.put("TODOLIST", todo);
  }

}