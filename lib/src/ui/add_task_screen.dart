import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _title = "";
  String _priority = "Low";
  DateTime _dataTime = DateTime.now();
  TextEditingController dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat("MMM dd, yyyy");

  final List<String> _list = ["Low", "Medium", "High"];

  _handleDate() async {
    final date = await showDatePicker(
        context: context,
        initialDate: _dataTime,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    // ignore: unrelated_type_equality_checks
    if (date != _dataTime) {
      setState(() {
        _dataTime = date as DateTime;
      });
      dateController.text = _dateFormat.format(date!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Text"),
                      onSaved: (input) => _title = input,
                    ),
                    TextFormField(
                      controller: dateController,
                      onTap: _handleDate,
                      decoration: InputDecoration(labelText: "Date"),
                      onSaved: (input) => _dataTime = input! as DateTime,
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: "Priority"),
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (value) {
                        setState(() {
                          _priority = value!;
                        });
                      },
                      items: _list.map((uzgaruvchi) {
                        return DropdownMenuItem<String>(
                            value: uzgaruvchi, child: Text(uzgaruvchi));
                      }).toList(),
                      value: _priority,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
