import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import 'package:to_do_app/service/database.dart';
import 'package:to_do_app/utils/fluttertoast.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController _task = TextEditingController();
  final TextEditingController _description = TextEditingController();

  int _currentindex = 0;

  Stream<QuerySnapshot>? alltasks;

  dynamic getinit() {
    alltasks = DatabaseHelper().getalltask();
    setState(() {});
  }

  @override
  void initState() {
    getinit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: HeroIcon(
              HeroIcons.listBullet,
              size: 30,
              style: HeroIconStyle.mini,
            ),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: HeroIcon(HeroIcons.plusCircle, size: 30),
            label: "Add",
          ),
        ],
        currentIndex: _currentindex,
        onTap: (value) {
          setState(() {
            _currentindex = value;
          });
          if (value == 1) {
            _task.clear();
            _description.clear();
            opensheet(context);
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.purple,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: alltasks,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? ListView.separated(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, index) {
                      DocumentSnapshot docssnap = snapshot.data.docs[index];
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.only(top: 5),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                docssnap['task'],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                docssnap['description'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      _task.text = docssnap["task"];
                                      _description.text =
                                          docssnap['description'];
                                      opensheet1(context, docssnap.id);
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStatePropertyAll(
                                        Colors.black,
                                      ),
                                    ),
                                    child: Text("edit"),
                                  ),
                                  OutlinedButton(
                                    onPressed: () async {
                                      await DatabaseHelper().deletetask(
                                        docssnap.id,
                                      );
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStatePropertyAll(
                                        Colors.black,
                                      ),
                                    ),
                                    child: Text("delete"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  // BOTTOM NAVIGATION BAR

  void opensheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,

      context: context,
      builder: (context) {
        return FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Add Task",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    // ADDING TITLE OR TASK
                    child: TextFormField(
                      controller: _task,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please add the task';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Task",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,

                    // DESCRIPTION
                    child: TextFormField(
                      controller: _description,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'please enter the field';
                      //   }
                      //   return null;
                      // },
                      minLines: 4,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Description",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  // ELEVATED BUTTON FOR ADD TASK
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        String id = DateTime.now().millisecondsSinceEpoch
                            .toString();
                        Map<String, dynamic> taskmap = {
                          'task': _task.text.trim(),
                          'description': _description.text.trim(),
                          'createdat': FieldValue.serverTimestamp(),
                        };
                        try {
                          await DatabaseHelper().addtask(taskmap, id).then((
                            value,
                          ) {
                            Message.showmessage(message: "Succesfully added");
                          });
                        } catch (e) {
                          Message.showmessage(message: "something happend$e");
                        }
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      "Add Task",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // BOTTOM KEY 2
  void opensheet1(BuildContext context, id1) {
    showModalBottomSheet(
      isDismissible: false,

      context: context,
      builder: (context) {
        return FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentGeometry.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Update Task",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ),

                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    // ADDING TITLE OR TASK
                    child: TextFormField(
                      controller: _task,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please add the task';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Task",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,

                    // DESCRIPTION
                    child: TextFormField(
                      controller: _description,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'please enter the field';
                      //   }
                      //   return null;
                      // },
                      minLines: 4,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Description",
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  // ELEVATED BUTTON FOR ADD TASK
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        Map<String, dynamic> updatemap = {
                          'task': _task.text.trim(),
                          'description': _description.text.trim(),
                          'createtime': FieldValue.serverTimestamp(),
                        };
                        await DatabaseHelper().updatetask(updatemap, id1).then((
                          value,
                        ) {
                          Message.showmessage(message: 'succesfully updated');
                          Navigator.pop(context);
                        });
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).primaryColor,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      "Update Task",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
