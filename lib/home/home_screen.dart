import 'package:flutter/material.dart';
import 'package:todo/sceers/settings.dart';
import 'package:todo/sceers/tasks.dart';

import '../sceers/widget/show_add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
          title: Text(
        'Todo App',
        style: Theme.of(context).textTheme.bodyLarge,
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskSheet();
        },
        child: Icon(Icons.add),
        shape: StadiumBorder(
            side: BorderSide(
          color: Colors.white,
          width: 3,
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconSize: 30,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: ''),
          ],
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasksScreen(), SettingsScreen()];

  void showAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ShowAddTaskBottomSheet();
      },
    );
  }
}
