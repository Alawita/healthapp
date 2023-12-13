import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final usernameController = TextEditingController();
  final pswrdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text("Sign in"),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 250,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Enter your username here',
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.abc)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70,
                    width: 250,
                    child: TextField(
                      obscureText: true,
                      controller: pswrdController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Enter your password here',
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.password_rounded)),
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (pswrdController.text == "kuwait") {
                    GoRouter.of(context).go("/homepage");
                  }
                },
                label: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.login,
                  color: Colors.black,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                label: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ));
  }
}
