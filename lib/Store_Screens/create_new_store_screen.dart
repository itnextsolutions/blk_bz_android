import 'package:block_buzz_android/Store_Screens/verification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateStoreScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Colors.orange.shade700;
    final TextStyle buttonTextStyle = TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    // final Color textColor = Theme
    //     .of(context)
    //     .textTheme
    //     .headline6!
    //     .color!;

    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text('Create New Store'),
      // ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      "assets/BlockON.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 45),
                  Text(
                    "Create New Store",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Store ID",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.store),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Store ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Create Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.vpn_key),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    color: buttonColor,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width,
                      onPressed: () {
                        // Navigate to the verification screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(
                              email: emailController.text,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "Create",
                        textAlign: TextAlign.center,
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}