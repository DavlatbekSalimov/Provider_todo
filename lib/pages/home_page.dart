import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provieder_todo/controller/homeCtr.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //?   'title-decription+dataTime*true'

  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoController>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: todo.todolist.length,
        itemBuilder: (context, index) {
          int ayruvindex = todo.todolist[index].indexOf('-');
          int plusindex = todo.todolist[index].indexOf('+');
          int kopindex = todo.todolist[index].indexOf('*');

          String title = todo.todolist[index].substring(0, ayruvindex);
          String discption =
              todo.todolist[index].substring(ayruvindex + 1, plusindex);
          String datetime =
              todo.todolist[index].substring(plusindex + 1, kopindex - 10);
          bool ischak = (todo.todolist[index].substring(kopindex + 1)) == 'true'
              ? true
              : false;
          return Card(
            child: ListTile(
              trailing: PopupMenuButton(
                  itemBuilder: (contex) => [
                        PopupMenuItem(
                          onTap: () async {
                            final uptitle = TextEditingController(text: title);
                            final updiscription =
                                TextEditingController(text: discption);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: uptitle,
                                            decoration: const InputDecoration(
                                              hintText: 'updetetitle:',
                                            ),
                                          ),
                                          TextField(
                                            controller: updiscription,
                                            decoration: const InputDecoration(
                                              hintText: 'updeteDe:',
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              OutlinedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  String data =
                                                      DateTime.now().toString();
                                                  String todomodel =
                                                      '${uptitle.text}-${updiscription.text}+$data*$ischak';
                                                  todo.updateTodo(
                                                      todomodel, index);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text('Save'),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Text('Update'),
                        ),
                        PopupMenuItem(
                          onTap: () async {
                            todo.removeTodo(index);
                          },
                          child: const Text('Dalete'),
                        ),
                      ]),
              leading: Checkbox(
                value: ischak,
                onChanged: (value) {
                  String model = ischak
                      ? todo.todolist[index].replaceAll('true', 'false')
                      : todo.todolist[index].replaceAll('false', 'true');
                  todo.updateTodo(model, index);
                },
              ),
              title: Text(title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    discption,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(datetime),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final titleCtr = TextEditingController();
          final decriptionCtr = TextEditingController();
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleCtr,
                        decoration: const InputDecoration(
                          hintText: 'title:',
                        ),
                      ),
                      TextField(
                        controller: decriptionCtr,
                        decoration: const InputDecoration(
                          hintText: 'description:',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              String data = DateTime.now().toString();
                              String a =
                                  '${titleCtr.text}-${decriptionCtr.text}+$data*false';
                              todo.addTodo(a);
                              Navigator.pop(context);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
