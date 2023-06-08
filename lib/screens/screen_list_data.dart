import 'package:flutter/material.dart';
import 'package:student_app/functions/db_functions.dart';
import 'package:student_app/models/data_model.dart';

class ListStudent extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  ListStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Student Profiles'),
        ),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext ctx, List<StudentModel> studentList,
              Widget? child) {
            return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = studentList[index];
                  return ListTile(
                    title: Text(data.name),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green[200],
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SimpleDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 248, 242, 182),
                                title: Text(
                                  'Update Details',
                                  textAlign: TextAlign.center,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 2.5,
                                        top: 5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      controller: _nameController
                                        ..text = data.name,
                                      // textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          labelText: ('Name')),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 2.5,
                                        top: 2.5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _ageController
                                        ..text = data.age,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          labelText: ('Age')),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 2.5,
                                        top: 2.5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: _phoneController
                                        ..text = data.phone,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          labelText: ('Phn')),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 2.5,
                                        top: 2.5),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: _emailController
                                        ..text = data.email,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          labelText: ('Roll Num')),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Transform.scale(
                                    scaleX: .5,
                                    scaleY: .7,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit),
                                      label: Text(
                                        'Update',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            if (data.id != null) {
                            } else {
                              print('Student id is null. Unable to delete');
                            }
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: studentList.length);
          },
        ),
      ),
    );
  }
}
