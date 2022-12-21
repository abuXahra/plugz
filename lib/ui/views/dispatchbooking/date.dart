import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyDatandTimePicker extends StatefulWidget {
  const MyDatandTimePicker({
    super.key,
  });

  @override
  State<MyDatandTimePicker> createState() => _MyDatandTimePickerState();
}

class _MyDatandTimePickerState extends State<MyDatandTimePicker> {
  DateTime dateTime =
      DateTime(2022, 12, 24, 5, 30); // year month day hour minute

  File? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
            color: Colors.blue,
            child: const Text("Pick Image from Gallery",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold)),
            onPressed: () {}),
        MaterialButton(
            color: Colors.blue,
            child: const Text("Pick Image from Camera",
                style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold)),
            onPressed: () {}),
        Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
        ElevatedButton(
            child: Text('date'),
            onPressed: () async {
              final date = await pickDate();
              if (date == null) return;
              final newDateTime = DateTime(date.year, date.month, date.day,
                  dateTime.hour, dateTime.minute);

              setState(() {
                dateTime = newDateTime;
              });
            }),
        SizedBox(
          height: 50.0,
        ),
        Text('${dateTime.year}/${dateTime.month}/${dateTime.day}'),
        ElevatedButton(
            child: Text(
                '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}'),
            onPressed: () async {
              final time = await pickTime();
              if (time == null) return;
              final newDateTime = DateTime(dateTime.year, dateTime.month,
                  dateTime.day, time.hour, time.minute);
              setState(() {
                dateTime = newDateTime;
              });
            }),
      ],
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
