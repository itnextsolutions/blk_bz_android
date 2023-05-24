import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'create_new_store_screen.dart';
import 'homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // form key
  final _formKey = GlobalKey<FormState>();
  // editing controller
  // ignore: non_constant_identifier_names
  final TextEditingController UserNameController = TextEditingController();
  // ignore: unnecessary_new
  final TextEditingController passwordController = new TextEditingController();

  String _loginError = ''; // Update to string type to store error message

  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    // email field
    // ignore: non_constant_identifier_names
    final UserNameField = TextFormField(
        autofocus: false,
        controller: UserNameController,
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          UserNameController.text = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'UserName is required';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.verified_user_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "User Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: passToggle,
        onSaved: (value) {
          passwordController.text = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is required';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          suffix: InkWell(
            onTap: () {
              setState(() {
                passToggle = !passToggle;
              });
            },
            child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange.shade700,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          // Reset login error before making a login request
          setState(() {
            _loginError = ''; // Reset error message
          });

          http.Response response = await http.post(
            Uri.parse('https://test.vastraindia.com/api/login/login'),
            // Uri.parse('https://10.0.2.2:7058/api/login/login'),
            //Uri.parse('https://localhost:7058//api/login/login'),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              "username": UserNameController.text,
              "password": passwordController.text,
            }),
          );

          if (response.statusCode == 200) {
            var responseData = json.decode(response.body);
            if (responseData == "Success") {
              print('success');
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            } else {
              // Update login error when response is not success
              setState(() {
                _loginError =
                'Invalid User Name or Password'; // Update error message here
              });
            }
          } else {
            setState(() {
              _loginError =
              'Something went wrong, please try again'; // Update error message
            });
          }
        },

        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    const SizedBox(height: 15);
    Text(
      _loginError, // Display the login error message
      style: const TextStyle(color: Colors.red),
    );

    final loginErrorWidget = Visibility(
      visible: _loginError.isNotEmpty,
      child: Text(
        _loginError,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 16.0,
        ),
      ),
    );


    final createNewStoreOption = GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateStoreScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Text(
          "Create New Store",
          style: TextStyle(
            color: Theme.of(context).textTheme.headline6!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final forgetPasswordOption = GestureDetector(
      onTap: () {
        // Handle forget password option
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Text(
          "Forget Password?",
          style: TextStyle(
            color: Theme.of(context).textTheme.headline6!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final userLoginOption = GestureDetector(
      onTap: () {
        // Handle user login option
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Text(
          "User Login",
          style: TextStyle(
            fontSize: 18, // Increase the font size as desired
            color: Theme.of(context).textTheme.headline6!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    final corporateLoginOption = GestureDetector(
      onTap: () {
        // Handle corporate login option
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        child: Text(
          "Corporate Login",
          style: TextStyle(
            fontSize: 18, // Increase the font size as desired
            color: Theme.of(context).textTheme.headline6!.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
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
                      "Store Login",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 25),
                    UserNameField,
                    const SizedBox(height: 25),
                    passwordField,
                    const SizedBox(height: 35),
                    loginErrorWidget,
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        createNewStoreOption,
                      forgetPasswordOption,
                      ],
                    ),

                    const SizedBox(height: 15),
                    loginButton,
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        userLoginOption,
                        corporateLoginOption,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}