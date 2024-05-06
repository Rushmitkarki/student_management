import 'package:flutter/material.dart';
import 'package:student_management/common_widget/my_button.dart';
import 'package:student_management/model/student_model.dart';

class StudentDetailsScreen extends StatefulWidget {
  const StudentDetailsScreen({super.key});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  final _gap = const SizedBox(height: 10);

  // final _fnameController = TextEditingController();
  // final _lnameController = TextEditingController();
  // final _cityController = TextEditingController();

  // final cities = [
  //   const DropdownMenuItem(value: 'Kathmandu', child: Text('Kathmandu')),
  //   const DropdownMenuItem(value: 'Bhaktapur', child: Text('Bhaktapur')),
  //   const DropdownMenuItem(value: 'Lalitpur', child: Text('Lalitpur')),
  // ];
  late TextEditingController _fnameController;
  late TextEditingController _lnameController;
  late TextEditingController _cityController;

  List<DropdownMenuItem> cities = [];

  @override
  void initState() {
    _fnameController = TextEditingController();
    _lnameController = TextEditingController();
    _cityController = TextEditingController();
    cities = [
      const DropdownMenuItem(value: 'Kathmandu', child: Text('Kathmandu')),
      const DropdownMenuItem(value: 'Bhaktapur', child: Text('Bhaktapur')),
      const DropdownMenuItem(value: 'Lalitpur', child: Text('Lalitpur')),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  final _key = GlobalKey<FormState>();

  List<Student> students = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: _fnameController,
                decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter fname';
                  }
                  return null;
                },
              ),
              _gap,
              TextFormField(
                controller: _lnameController,
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter lname';
                  }
                  return null;
                },
              ),
              _gap,
              DropdownButtonFormField(
                items: cities,
                onChanged: (value) {
                  _cityController.text = value.toString();
                },
                decoration: const InputDecoration(
                  hintText: 'Select city',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Please select city';
                  }
                  return null;
                },
              ),
              _gap,
              SizedBox(
                  width: double.infinity,
                  child: MyButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          final student = Student(
                            fname: _fnameController.text,
                            lname: _lnameController.text,
                            city: _cityController.text,
                          );
                          setState(() {
                            students.add(student);
                          });
                        }
                      },
                      text: 'Add Student')),
              _gap,
              MyButton(onPressed: () {}, text: 'View Student'),
              const Text(
                'Student List',
                style: TextStyle(fontSize: 20),
              ),
              _gap,
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return MyCardWidget(
                      students: students,
                      index: index,
                    );
                    // return ListTile(
                    //   title: Text(students[index].fname),
                    //   subtitle: Text(students[index].city),
                    //   trailing: IconButton(
                    //     icon: const Icon(Icons.delete),
                    //     onPressed: () {
                    //       setState(() {
                    //         students.removeAt(index);
                    //       });
                    //     },
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({
    super.key,
    required this.students,
    required this.index,
  });

  final List<Student> students;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Card(
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'First Name: ${students[index].fname}',
              ),
              Text('Last Name: ${students[index].lname}'),
            ],
          ),
        ),
      ),
    );
  }
}
