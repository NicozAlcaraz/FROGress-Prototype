import 'package:flutter/material.dart';
import 'package:frogressprototype/task_page.dart'; // Import TaskPage here

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            // Today Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  'Monday, 5 April',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                TaskCategory(
                  category: 'Completed',
                  count: 5,
                  description: 'Tasks Completed',
                ),
                SizedBox(height: 12),
                TaskCategory(
                  category: 'To Do',
                  count: 2,
                  description: 'Tasks now',
                ),
              ],
            ),

            // Past Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Past',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  'Sunday, 4 April',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                TaskCategory(
                  category: 'Completed',
                  count: 5,
                  description: 'Tasks Completed',
                ),
                SizedBox(height: 12),
                TaskCategory(
                  category: 'To Do',
                  count: 2,
                  description: 'Tasks now - Failed',
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task, size: 28),
            label: 'Tasks',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // Navigate to TaskPage when "Tasks" is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TaskPage()),
            );
          }
        },
      ),
    );
  }
}

class TaskCategory extends StatelessWidget {
  final String category;
  final int count;
  final String description;

  TaskCategory({
    required this.category,
    required this.count,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade100),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(height: 4),
              Text(
                '$count $description',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.grey),
            onPressed: () {
              // Handle the '...' action here
            },
          ),
        ],
      ),
    );
  }
}
