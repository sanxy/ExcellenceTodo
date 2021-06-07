

import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  int id;
  String itemName;
  String dateCreated;

  TodoItem(this.itemName, this.dateCreated);

  TodoItem.map(dynamic obj) {
    this.itemName = obj['item_name'];
    this.dateCreated = obj['date_created'];
    this.id = obj['id'];
  }

  int get id => id;

  String get itemName => itemName;

  String get dateCreated => dateCreated;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['item_name'] = this.itemName;
    map['date_created'] = this.dateCreated;

    if (this.id != null) {
      map['id'] = this.id;
    }
    return map;
  }

  TodoItem.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.itemName = map['item_name'];
    this.dateCreated = map['date_created'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            itemName,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.9),
          ),
          Padding(
            padding: const EdgeInsets.only(top : 8.0),
            child: Text(
              dateCreated,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.5,
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        ],
      ),
    );
  }
}
