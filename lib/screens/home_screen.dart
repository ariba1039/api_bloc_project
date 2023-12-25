import 'package:api_bloc_project/screens/product_screen.dart';
import 'package:api_bloc_project/screens/users_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const UsersScreen();
                }));
              },
              child: const Text(
                'Get Users ',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductScreen();
                  }));
                },
                child: const Text(
                  'Get Products ',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
