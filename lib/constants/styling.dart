import 'package:flutter/material.dart';
import 'package:my_todo_app/constants/colors.dart';

const TextStyle kAppBarTextStyle = TextStyle(
  fontWeight: FontWeight.bold, // Customizing font weight
  fontSize: 52, // Customizing font size
  color: purpleColor, // Using a consistent color
);

const InputDecoration kInputfieldDecoration = InputDecoration(
    border: InputBorder.none,
    hintText: "Add new task",
    hintStyle: TextStyle(fontSize: 20),
    contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 20));

const TextStyle kAllTodosTitleStyle =
    TextStyle(fontWeight: FontWeight.w800, fontSize: 25, color: purpleColor);
