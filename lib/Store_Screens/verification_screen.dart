import 'package:flutter/material.dart';
import 'dart:async';

class VerificationScreen extends StatefulWidget {
  final String email;

  VerificationScreen({required this.email});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  int _resendSeconds = 20;
  Timer? _resendTimer;
  bool _isVerificationSuccessful = false;

  @override
  void initState() {
    super.initState();
    startResendTimer();
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    super.dispose();
  }

  void startResendTimer() {
    _resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendSeconds > 0) {
          _resendSeconds--;
        } else {
          _resendTimer?.cancel();
        }
      });
    });
  }

  String formatResendTime(int seconds) {
    int minutes = (seconds / 60).floor();
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return "$formattedMinutes:$formattedSeconds";
  }

  void verify() {
    // Perform verification logic
    bool isVerificationSuccessful = true; // Replace with your logic to determine verification success
    setState(() {
      _isVerificationSuccessful = isVerificationSuccessful;
    });

    if (_isVerificationSuccessful) {
      showSuccessDialog();
    }
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.check,
                    size: 40,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Your Store Has Been Added Successfully',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Colors.orange.shade700;
    final TextStyle buttonTextStyle = TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    final TextStyle blackTextStyle = TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
    final TextStyle orangeTextStyle = TextStyle(
      fontSize: 16,
      color: buttonColor,
    );

    return Scaffold(
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
                  const SizedBox(height: 20),
                  Text(
                    "Verification Code",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: buttonColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Waiting For OTP Send To Email ID :",
                    style: blackTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VerificationCodeBox(),
                      VerificationCodeBox(),
                      VerificationCodeBox(),
                      VerificationCodeBox(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Didn't receive the code?",
                    style: blackTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    _resendSeconds > 0
                        ? "Resend in ${formatResendTime(_resendSeconds)}"
                        : "Resend",
                    style: orangeTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    color: buttonColor,
                    child: MaterialButton(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: verify,
                      child: Text(
                        "Verify",
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

class VerificationCodeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
