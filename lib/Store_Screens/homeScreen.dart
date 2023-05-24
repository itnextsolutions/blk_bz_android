import 'package:flutter/material.dart';

import 'Login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _profilePhoto = 'assets/profile.png';
  String _username = 'admin';
  int _notificationCount = 99; // Example notification count
  bool _apparelChecked = false;
  bool _fashionChecked = false;
  bool _foodChecked = false;
  bool _electronicsChecked = false;
  bool _beautyChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200], // Set the background color to light gray
        centerTitle: true,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: 30, // Set the size of the bell icon
                    color: Colors.orange, // Set the color to orange
                  ),
                  onPressed: () {
                    // Implement notification icon pressed logic here
                    print("Notification icon pressed");
                    // Add your logic here for handling notification icon press
                  },
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.orange, // Set the background color to orange
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      _notificationCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(_profilePhoto),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _username,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.indigoAccent,
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text('My Account'),
              onTap: () {
                // Implement My Account button press logic here
                print("My Account pressed");
                // Add your logic here for My Account
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text('Settings'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (BuildContext context) => SettingsPage()),
            //     );
            //   },
            // ),
            const Divider(
              color: Colors.indigoAccent,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/BlockON.png',
                width: 130, // Set the width of the small logo
                height: 130, // Set the height of the small logo
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Pick Store Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange, // Set the text color to orange
                  ),
                  textAlign: TextAlign.center, // Center align the text
                ),
              ),
            ),
    SizedBox(height: 10),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey), // Add border to the container
    borderRadius: BorderRadius.circular(5), // Add border radius to the container
    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    TextField(
    decoration: InputDecoration(
    hintText: 'Enter store name',
    labelText: 'Search',
    suffixIcon: Icon(Icons.search),
    border: InputBorder.none, // Remove border from the search field
    ),
    ),
    // SizedBox(height: 10),
    // Text(
    // 'Categories:',
    // style: TextStyle(
    // fontWeight: FontWeight.bold,
    // ),
    // ),
    SizedBox(height: 5),
    Row(
    children: [
    Checkbox(
    value: _apparelChecked,
    onChanged: (value) {
    setState(() {
    _apparelChecked = value ?? false;
    });
    },
    ),
    Text('Apparel'),
    SizedBox(width: 10),
    Checkbox(
    value: _fashionChecked,
    onChanged: (value) {
    setState(() {
    _fashionChecked = value ?? false;
    });
    },
    ),
    Text('Fashion'),
    ],
    ),
    Row(
    children: [
    Checkbox(
    value: _foodChecked,
    onChanged: (value) {
    setState(() {
    _foodChecked = value ?? false;
    });
    },
    ),
    Text('Food'),
    SizedBox(width: 10),
    Checkbox(
    value: _electronicsChecked,
    onChanged: (value) {
    setState(() {
    _electronicsChecked = value ?? false;
    });
    },
    ),
    Text('Electronics'),
    ],
    ),
    Row(
    children: [
    Checkbox(
    value: _beautyChecked,
    onChanged: (value) {
    setState(() {
    _beautyChecked = value ?? false;
    });
    },
    ),
    Text('Beauty'),
    ],
    ),
    ],
    ),
    ),
    ),
    ),
    ])
    ));
  }
}




//
//
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool _apparelChecked = false;
//   bool _fashionChecked = false;
//   bool _foodChecked = false;
//   bool _electronicsChecked = false;
//   bool _beautyChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         backgroundColor: Colors.grey[200], // Set the background color to light gray
//         centerTitle: true,
//         actions: <Widget>[
//         IconButton(
//         icon: Icon(
//         Icons.notifications,
//         size: 30, // Set the size of the bell icon
//         color: Colors.orange, // Set the color to orange
//     ),
//     onPressed: () {
//     // Implement notification icon pressed logic here
//     print("Notification icon pressed");
//     // Add your logic here for handling notification icon press
//     },
//     ),
//     ],
//     ),
//     drawer: Drawer(
//     child: ListView(
//     padding: EdgeInsets.zero,
//     children: <Widget>[
//     DrawerHeader(
//     decoration: const BoxDecoration(
//     color: Colors.orange,
//     ),
//     child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//     CircleAvatar(
//     radius: 40,
//     backgroundImage: AssetImage('assets/profile.png'),
//     ),
//     const SizedBox(height: 10),
//     Text(
//     'admin',
//     style: const TextStyle(
//     fontSize: 18,
//     color: Colors.white,
//     ),
//     ),
//     ],
//     ),
//     ),
//     const Divider(
//     color: Colors.indigoAccent,
//     ),
//     ListTile(
//     leading: const Icon(Icons.account_box),
//     title: const Text('My Account'),
//     onTap: () {
//     // Implement My Account button press logic here
//     print("My Account pressed");
//     // Add your logic here for My Account
//     },
//     ),
//     const Divider(
//     color: Colors.indigoAccent,
//     ),
//     ListTile(
//     leading: const Icon(Icons.logout),
//     title: const Text('Logout'),
//     onTap: () {
//     // Implement Logout button press logic here
//     print("Logout pressed");
//     // Add your logic here for Logout
//     },
//     ),
//     ],
//     ),
//     ),
//     body: SingleChildScrollView(
//     child: Column(
//     children: [
//     SizedBox(height: 20),
//     Center(
//     child: Image.asset(
//     'assets/BlockON.png',
//     width: 130, // Set the width of the logo
//     height: 130, // Set the height of the logo
//     ),
//     ),
//     SizedBox(height: 10),
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Container(
//     decoration: BoxDecoration(
//     border: Border.all(color: Colors.grey), // Add border to the container
//     borderRadius: BorderRadius.circular(5), // Add border radius to the container
//     ),
//     child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     'Enter Store Name:',
//     style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.orange, // Set the text color to orange
//     ),
//     ),
//     SizedBox(height: 5),
//     TextField(
//     decoration: InputDecoration(
//     hintText: 'Store Name',
//     border: InputBorder.none,
//     ),
//     ),
//     SizedBox(height: 10),
//     Text(
//     'Enter Store GST Number:',
//     style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.orange, // Set the text color to orange
//     ),
//     ),
//     SizedBox(height: 5),
//     TextField(
//     decoration: InputDecoration(
//     hintText: 'GST Number',
//     border: InputBorder.none,
//     ),
//     ),
//     SizedBox(height: 10),
//     Text(
//     'Enter Store Address:',
//     style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.orange, // Set the text color to orange
//     ),
//     ),
//     SizedBox(height: 5),
//     TextField(
//     decoration: InputDecoration(
//     hintText: 'Store Address',
//     border: InputBorder.none,
//     ),
//     ),
//     ],
//     ),
//     ),
//     ),
//     ),
//     SizedBox(height: 10),
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Container(
//     decoration: BoxDecoration(
//     border: Border.all(color: Colors.grey), // Add border to the container
//     borderRadius: BorderRadius.circular(5), // Add border radius to the container
//     ),
//     child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     'Upload Your Business Logo:',
//     style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.orange, // Set the text color to orange
//     ),
//     ),
//     SizedBox(height: 5),
//     Row(
//     children: [
//     Expanded(
//     child: TextField(
//     decoration: InputDecoration(
//     hintText: 'Upload Business Logo',
//     border: InputBorder.none,
//     ),
//     ),
//     ),
//     IconButton(
//     icon: Icon(Icons.add),
//     onPressed: () {
//     // Implement upload logo logic here
//     },
//     ),
//     ],
//     ),
//     ],
//     ),
//     ),
//     ),
//     ),
//     SizedBox(height: 10),
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20),
//     child: Container(
//     decoration: BoxDecoration(
//     border: Border.all(color: Colors.grey), // Add border to the container
//     borderRadius: BorderRadius.circular(5), // Add border radius to the container
//     ),
//     child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//     Text(
//     'Upload Your Business Photos:',
//     style: TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.orange, // Set the text color to orange
//     ),
//     ),
//     SizedBox(height: 5),
//     Row(
//     children: [
//     Expanded(
//     child: TextField(
//     decoration: InputDecoration(
//     hintText: 'Upload Business Photo 1',
//     border: InputBorder.none,
//     ),
//     ),
//     ),
//       IconButton(
//         icon: Icon(Icons.add),
//         onPressed: () {
//           // Implement upload photo logic here
//         },
//       ),
//     ],
//     ),
//       SizedBox(height: 5),
//       Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Upload Business Photo 2',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               // Implement upload photo logic here
//             },
//           ),
//         ],
//       ),
//       SizedBox(height: 5),
//       Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Upload Business Photo 3',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               // Implement upload photo logic here
//             },
//           ),
//         ],
//       ),
//       SizedBox(height: 5),
//       Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Upload Business Photo 4',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               // Implement upload photo logic here
//             },
//           ),
//         ],
//       ),
//       SizedBox(height: 10),
//       ElevatedButton(
//         onPressed: () {
//           // Implement preview button press logic here
//         },
//         child: Text('Preview'),
//       ),
//     ],
//     ),
//     ),
//     ),
//     ),
//     ],
//     ),
//     ),
//     );
//   }
// }