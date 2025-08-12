import 'package:flutter/material.dart';
import 'package:latihan_11pplg1/pages/home_page.dart';
import 'package:latihan_11pplg1/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  

  final String correctEmail = "admin";
  final String correctPassword = "123";

    void handleLogin() {
    String email = emailController.text;
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
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  handleLogin();
                },
                child: Text('Login'),
              ),
            ),
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
