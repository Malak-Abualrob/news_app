import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_text_form_feild.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
              SizedBox(height: 24),
              CustomTextFormField(
                controller: emailController,
                hintText: "malak@gmail.com",
                title: "Email",
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                controller: passwordController,
                hintText: "********",
                title: "Password",
                obscureText: true,
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(onPressed: () {}, child: Text("sign in")),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
