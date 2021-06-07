
import 'package:flutter/material.dart';
import '../database_helper.dart';


class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final dbHelper = DatabaseHelper.instance;

  final textEditingController = TextEditingController();
  bool validated = true;
  String errorText = "";
  String todoEdited = "";
  var myItems = [];
  List<Widget> children = [];

  void addTodo() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: todoEdited,
    };
    final id = await dbHelper.insert(row);
    print(id);
    Navigator.pop(context);
    todoEdited = "";
    setState(() {
      validated = true;
      errorText = "";
    });
  }

  Future<bool> query() async {
    myItems = [];
    children = [];
    var allRows = await dbHelper.queryAll();
    allRows.forEach((row) {
      myItems.add(row.toString());
      children.add(Card(
        elevation: 5.0,
        margin: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              row['todo'],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),

          ),
        ),
      ));
    });
    return Future.value(true);
  }

  void showAlertDialog() {
    textEditingController.text = "";
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Text(
                "Add Todo",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: textEditingController,
                    autofocus: true,
                    onChanged: (_val) {
                      todoEdited = _val;
                    },
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      errorText: validated ? null : errorText,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            if (textEditingController.text.isEmpty) {
                              setState(() {
                                errorText = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (textEditingController.text.length >
                                512) {
                              setState(() {
                                errorText = "Too may Characters";
                                validated = false;
                              });
                            } else {
                              addTodo();
                            }
                          },
                          // color: Colors.purple,
                          child: Text("SAVE",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snap) {
        // ignore: unnecessary_null_comparison
        if (snap.hasData == null) {
          return Center(
            child: Text(
              "No Data",
            ),
          );
        } else {
          if (myItems.length == 0) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
              appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                centerTitle: true,
                title: Text(
                  "My Todo List",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.blueGrey,
              body: Center(
                child: Text(
                  "No Task Present",
                  style: TextStyle(
                      fontSize: 20.0),
                ),
              ),
            );
          } else {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: showAlertDialog,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
              appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                centerTitle: true,
                title: Text(
                  "My Todo List",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              backgroundColor: Colors.blueGrey,
              body: SingleChildScrollView(
                child: Column(
                  children: children,
                ),
              ),
            );
          }
        }
      },
      future: query(),
    );
  }
}
