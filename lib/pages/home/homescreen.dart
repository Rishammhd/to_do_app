import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final int _currentindex = 0;

  // final List _pages = [Listbutton(), Addbutton()];
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
            icon: HeroIcon(HeroIcons.plus, size: 30),
            label: "Add",
          ),
        ],
        currentIndex: _currentindex,
        onTap: (value) {
          if (value == 1) {
            _opensheet(context);
          }
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.purple,
      ),
      body: SafeArea(child: Center(child: Text("hyy"))),
    );
  }

  void _opensheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FractionallySizedBox(
          widthFactor: 0.9,
          child: Container(
            // height: MediaQuery.of(context).size.height * 0.10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Add Task",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.purple,
                    ),
                  ),
                ),

                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
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
