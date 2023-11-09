import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:editable_image/editable_image.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _profilePicFile;
  String? _datePick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                //Modify pic
                Container(
                  child: EditableImage(
// Define the method that will run on the change process of the image.
                    onChange: (file) => _directUpdateImage(file),

// Define the source of the image.
                    image: _profilePicFile != null
                        ? Image.file(_profilePicFile!, fit: BoxFit.cover)
                        : null,

// Define the size of EditableImage.
                    size: 150.0,

// Define the Theme of image picker.
                    imagePickerTheme: ThemeData(
                      // Define the default brightness and colors.
                      primaryColor: Colors.white,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.white70,
                      iconTheme: const IconThemeData(color: Colors.black87),

                      // Define the default font family.
                      fontFamily: 'Georgia',
                    ),

// Define the border of the image if needed.
                    imageBorder: Border.all(color: Colors.black87, width: 2.0),

// Define the border of the icon if needed.
                    editIconBorder:
                        Border.all(color: Colors.black87, width: 2.0),
                  ),
                ),
                //Input field
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .7,
                            color: Color.fromARGB(255, 221, 20, 20),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Firstname',
                            hintStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .7,
                            color: Color.fromARGB(255, 221, 20, 20),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Lastname',
                            hintStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .7,
                            color: Color.fromARGB(255, 221, 20, 20),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .7,
                            color: Color.fromARGB(255, 221, 20, 20),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: .7,
                            color: Color.fromARGB(255, 221, 20, 20),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm the password',
                            hintStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Calendar
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: Calendar(
                              startOnMonday: true,

                              displayMonthTextStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 221, 20, 20)),
                              weekDays: [
                                'Mo',
                                'Tu',
                                'We',
                                'Th',
                                'Fr',
                                'Sa',
                                'Su'
                              ],
                              // eventsList: ,
                              // isExpandable: true,
                              eventDoneColor: Colors.green,
                              selectedColor: Colors.pink,
                              selectedTodayColor: Colors.red,
                              todayColor: Colors.blue,
                              eventColor: null,
                              locale: 'En',
                              todayButtonText: 'Birthday',
                              allDayEventText: 'Ganztägig',
                              multiDayEndText: 'Ende',
                              isExpanded: true,
                              // datePickerType: DatePickerType.date,
                              dayOfWeekStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 11,
                              ),

                              onDateSelected: (DateTime daySelected) {
                                setState(
                                  () {
                                    _datePick = DateFormat('yyyy-MM-dd')
                                        .format(daySelected);
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 221, 20, 20),
                        // border: Border.all(
                        //   width: .3,
                        //   color: const Color.fromARGB(255, 221, 20, 20)!,
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            _datePick ?? 'Choose your Birthday date',
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 411,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        // horizontal: ,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 221, 20, 20),
                        // border: Border.all(
                        //   width: .3,
                        //   color: const Color.fromARGB(255, 221, 20, 20)!,
                        // ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _directUpdateImage(File? file) async {
    if (file == null) return;

    setState(() {
      _profilePicFile = file;
    });
  }
}
