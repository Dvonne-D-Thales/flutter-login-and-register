import 'package:flutter/material.dart';
import 'package:latihan_11pplg1/home_page.dart';
import 'package:latihan_11pplg1/register_page.dart';
import 'package:latihan_11pplg1/widgets/reusable_button.dart';
import 'package:latihan_11pplg1/widgets/reusable_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  

  final String correctEmail = "admin";
  final String correctPassword = "123";

    void handleLogin() {
    String email = usernameController.text;
    String password = passwordController.text;

    if (email == correctEmail && password == correctPassword) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Successful"),
            content: Text("Welcome, $email!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else if (email == "" && password == "") {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("???"),
            content: Text("input email dan password kosong"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("PEYUSUP!!!"),
            content: Text("penyusup tidak dikenal, silahkan coba lagi"),
             actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Login Failed"),
            content: Text("Invalid email or password."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome to Login Page', style: TextStyle(fontSize: 18)),
            Text(
              "Please login using your email and password",
              style: TextStyle(
                fontSize: 10,
                color: const Color.fromARGB(255, 27, 141, 60),
              ),
            ),

            Container(margin: EdgeInsets.only(top: 20, bottom: 20)),
           const SizedBox(height: 30),
                CustomTextField(
                  label: "Name",
                  isPassword: false,
                  controller: usernameController,
                ),

            const SizedBox(height: 20),
                CustomTextField(
                  label: "Password",
                  isPassword: true,
                  controller: passwordController,
                ),

            SizedBox(height: 20),
              
                 Center(
                    child: CostumButton(
                    text: "Register",
                    textColor: const Color.fromARGB(255, 0, 235, 70),
                    onPressed: () {
                      if (
                          usernameController.text.isEmpty ||
                          passwordController.text.isEmpty 
                          ) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                      } else {
                        // Handle registration logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Registration successful!"),
                          ),
                        );
                      }
                    },
                  ),
                  ) ,   
              Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: Text('Register'),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
