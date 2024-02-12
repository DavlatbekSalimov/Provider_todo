import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoController extends ChangeNotifier {
  List<String> todolist = [];

  TodoController() {
    loadtodo();
  }

  Future<void> loadtodo() async {
    //? savat olindi
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    todolist = sharedPreferences.getStringList('todo') ?? [];
    notifyListeners();
  }

  Future<void> save() async {
    //? savatga malumotlar saqlandi
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setStringList('todo', todolist);
  }

  void addTodo(String todomodel) {
    //? savatga malumotlar yig'indisi jamlangan
    todolist.add(todomodel);
    //? instance olindi
    save();
    notifyListeners();
  }

  void removeTodo(int index) {
    //? malumot o'chirildi
    todolist.removeAt(index);
    save();
    notifyListeners();
  }

  void updateTodo(String todomodel, int index) {
    //? malumot update bo'ldi
    todolist[index] = todomodel;
    save();
    notifyListeners();
  }
}

class TodoControllerr extends ChangeNotifier {
  List<String> todolist = [];

  Future<void> createStore() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getStringList('listim');
  }

  Future<void> saveDB() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('list', todolist);
  }

  void removeTodo({required int index}) {
    todolist.remove(index);
  }

  void addTodo({required String newtodo}) {
    todolist.add(newtodo);
  }

  void updeteTodo({required String newtodo, required int index}) {
    todolist[index] = newtodo;
  }
}
