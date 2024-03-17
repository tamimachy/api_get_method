import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'customer_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  Future<dynamic> _login(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    String Url =
        "https://www.pqstec.com/InvoiceApps/Values/LogIn?UserName=${_emailController.text}&Password=${_passwordController.text}&ComId=1";
    final response = await http.get(Uri.parse(Url));
    if (response.body.isNotEmpty) {
      try {
        final authToken = jsonDecode(response.body)['Token'];
        setState(() {
          isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerListPage(authToken: authToken),
          ),
        );
      } catch (error) {
        setState(() {
          isLoading = false;
        });
        final errorMessage = jsonDecode(response.body)['error'];
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () => _login(context),
                    child: const Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
