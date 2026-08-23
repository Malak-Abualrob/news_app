import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_image.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/images/logo.png", height: 45)),
              SizedBox(height: 40),
              Text("Welcome to News", style: TextStyle(fontSize: 24)),
              SizedBox(height: 10),
              Text(
                "Login to your account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              TextFormField(decoration: InputDecoration(labelText: "Email")),
              TextFormField(decoration: InputDecoration(labelText: "Password")),
              ElevatedButton(onPressed: () {}, child: Text("Login")),
              TextButton(
                onPressed: () {},
                child: Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
