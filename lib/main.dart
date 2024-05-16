import 'package:e_learning_moblie/pages/cart_page.dart';
import 'package:e_learning_moblie/pages/courses_page.dart';
import 'package:e_learning_moblie/pages/home_page.dart';
import 'package:e_learning_moblie/pages/my_course_page.dart';
import 'package:e_learning_moblie/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MainTabBarPage(),
  ));
}

class MainTabBarPage extends StatefulWidget {
  const MainTabBarPage({super.key});

  @override
  State<MainTabBarPage> createState() => _MainTabBarPageState();
}

class _MainTabBarPageState extends State<MainTabBarPage> {
  int selectedIndexPage = 0;

  static List<Widget> tabBarPage = [
    const CoursesPage(),
    const CardPage(),
    const HomePage(),
    const MyCoursePage(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBarPage[selectedIndexPage],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  BottomNavigationBar bottomNavigationBar(BuildContext builder) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      currentIndex: selectedIndexPage,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(IconlyBold.play), label: "Courses"),
        BottomNavigationBarItem(icon: Icon(IconlyBold.buy), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(IconlyBold.bookmark), label: "My Course"),
        BottomNavigationBarItem(
            icon: Icon(IconlyBold.profile), label: "Profile"),
      ],
    );
  }
}
