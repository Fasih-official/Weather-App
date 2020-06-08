import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCity extends StatefulWidget {
  String title = "City";

  @override
  State<StatefulWidget> createState() {
    return SearchCityState();
  }
}

class SearchCityState extends State<SearchCity> {
  TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      decoration: InputDecoration(labelText: 'City name'),
                      controller: _cityController,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_cityController.text.isNotEmpty) {
                      Navigator.pop(context, _cityController.text);
                    } else {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter city name')));
                    }
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
          ],
        ));
  }
}
