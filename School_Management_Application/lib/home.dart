import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController search = TextEditingController();

  List<Map<String, String>> data = [
    {'name': 'Institute', 'image': 'images/institute.png'},
    {'name': 'Teacher Managers', 'image': 'images/teacher.png'},
    {'name': 'Batches', 'image': 'images/batches.png'},
    {'name': 'Add Course', 'image': 'images/add_course.png'},
    {'name': 'Tuition Class', 'image': 'images/class.png'},
    {'name': 'Attendance', 'image': 'images/attendance.png'},
    {'name': 'Leave Management', 'image': 'images/leave.png'},
    {'name': 'MSP Regularisation', 'image': 'images/regularisation.png'},
    {'name': 'Holiday Management', 'image': 'images/holiday.png'},
    {'name': 'Leave Management', 'image': 'images/leave.png'},
  ];

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Notifications Page'),
    Text('Messages Page'),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool hasOddItems = data.length % 2 != 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // First Container
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin:
                      EdgeInsets.only(bottom: 16.0), // Space between containers
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 77, 0, 57),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            style: ButtonStyle(
                                iconColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              // Add your onPressed code here!
                            },
                          ),
                          Spacer(),
                          Text(
                            'Hello Karan!',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          IconButton(
                            style: ButtonStyle(
                                iconColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            icon: Icon(Icons.notifications_none),
                            onPressed: () {
                              // Add your onPressed code here!
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              5), // Adds spacing between the Row and the Text below
                      Center(
                          child: Text('Find tutor who will help you best',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      SizedBox(
                          height:
                              10), // Adds spacing between the Text and the TextField
                      TextField(
                        controller: search,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          hintText: "search all",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                // Second Container
                Container(
                  padding: EdgeInsets.all(16.0),
                  margin:
                      EdgeInsets.only(bottom: 16.0), // Space between containers
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 77, 0, 57),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              // child:  image == null ?  Image.asset("images/profile.png",height: 100,) : Image.file(File(image!.path,),fit: BoxFit.cover,width: 300,height: 300,),
                              child: Image.asset(
                                "images/user.png",
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Karan",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Wow Id:178373726",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              RatingBarIndicator(
                                rating: 3.5,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Image.asset(
                                "images/education.png",
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Teacher",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Row(children: [
                  Text(
                    "Attendence",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ]),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    itemCount: data.length + (hasOddItems ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == data.length) {
                        // This is the placeholder for centering the last item
                        return Container(
                          child: Center(
                            child: Image.asset(
                              'images/emt_image.png',
                              color: const Color.fromRGBO(255, 255, 255, 0.1),
                              colorBlendMode: BlendMode.modulate,
                            ),
                          ),
                        );
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              data[index]['image']!,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(
                            data[index]['name']!,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all items are displayed
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'course',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_sharp),
            label: 'Enrollments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Rating',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 77, 0, 57),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
