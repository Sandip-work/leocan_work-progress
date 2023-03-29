import 'package:flutter/material.dart';
import  'package:intl/intl.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static  final List<Widget> _pages = <Widget>[
    Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: GridView(
        shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20,50,50,30),
                  child: Text('Running',
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('22 projects',style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 30,),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.orange,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10,50,20,30),
                  child: Text('In process',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
                Row(
                  children: const [
                    Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text('32 projects',style: TextStyle(color: Colors.white),),
                  ),

                    SizedBox(width: 30,),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.green,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10,50,20,20),
                  child: Text('Complete',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('16 projects',style: TextStyle(color: Colors.white),),
                    ),

                    SizedBox(width: 30,),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.pink,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10,50,50,30),
                  child: Text('Cancel',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text('12 projects',style: TextStyle(color: Colors.white),),
                    ),

                    SizedBox(width: 30,),
                    Icon(Icons.arrow_forward,color: Colors.white,),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
    const Icon(
      Icons.calendar_month_outlined,
      size: 15,
    ),
    const Icon(
      Icons.description_rounded,
      size: 15,
    ),
    const Icon(
      Icons.message,
      size: 15,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("EEEE, dd, yyyy").format(DateTime.now());


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: const Icon(
            Icons.grid_view_outlined,
            color: Colors.black),
        title:  Text(date,
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 15),
        ),
        actions: [
          IconButton(
              onPressed: (){
              },
              icon: const Icon(
                Icons.person_outline_outlined,
                color: Colors.black,),
          )
        ],
      ),
      body: Container(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.grab,
        selectedItemColor: Colors.deepPurpleAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_rounded),
            label: 'Projects',
          ),
           BottomNavigationBarItem(
             icon: Icon(Icons.message),
             label: 'Messages',
           ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add,size: 35),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}