import 'package:flutter/material.dart';

import 'package:learn_flutter_68_2/model/person.dart';

class AppForm extends StatefulWidget {
  const AppForm({super.key});

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _age = 20;
  Jop? _jop = Jop.developer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Add Person",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Add Person"),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          // child: Column(
          //   children: [
          //     TextField(
          //       decoration: InputDecoration(labelText: "Name"),
          //     ),
          //     TextField(
          //       decoration: InputDecoration(labelText: "Age"),
          //       keyboardType: TextInputType.number,
          //     ),
          //     DropdownButtonFormField(
          //       decoration: InputDecoration(labelText: "Jop"),
          //       items: Jop.values.map((key) {
          //         return DropdownMenuItem(value: key, child: Text(key.title));
          //       }).toList(),
          //       onChanged: (value) {
          //         print("Selected job: ${value?.title}");
          //         },
          //     ),
          //     SizedBox(height: 20),
          //     FilledButton(
          //       onPressed: () {
          //       },
          //       style: FilledButton.styleFrom(
          //         backgroundColor: Colors.pinkAccent,
          //         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50 ),
          //       ),
          //       child: Text(
          //         "Submit",
          //         style: TextStyle(color: Colors.white, fontSize: 20),
          //       ),
          //     )
          //   ],
          // ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(label:Text("Name")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value ?? "";
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(label:Text("Age")),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an age';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.tryParse(value!) ?? 20;
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Jop"),
                  items: Jop.values.map((key) {
                    return DropdownMenuItem(value: key, child: Text(key.title));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _jop = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("Name: $_name, Age: $_age, Jop: ${_jop?.title}");

                      setState(() {
                        people.add(Person(name: _name, age: _age, job: _jop!));
                      });
                      _formKey.currentState!.reset();
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50 ),
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}