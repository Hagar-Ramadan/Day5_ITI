import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_application/todo.dart';

class Home extends StatelessWidget {
  bool value = false;

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        /*title: Text(
            "Todo Application",
            style: TextStyle(color: Colors.white),
          ),*/
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.menu,
            color: Colors.teal,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "ToDo List",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "12 Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                child: Consumer<Todo>(
                  builder: (context, todo, child) {
                    return ListView.builder(
                        itemCount: todo.tasklist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                  left: 32, right: 32, top: 8, bottom: 8),
                              title: Text(
                                todo.tasklist[index].title,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                todo.tasklist[index].details,
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Checkbox(
                                value: value,
                                onChanged: (value) {},
                              ),
                            ),
                            margin:
                                EdgeInsets.only(bottom: 8, left: 16, right: 16),
                          );
                        });
                  },
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<Todo>(context, listen: false).addTask();
        },
      ),
    );
  }
}
