import 'package:flutter/material.dart';
import 'package:github_api_portfolio/repository_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  Future apicall() async {
    http.Response response;
    response =
        await http.get(Uri.parse("https://api.github.com/users/jahidcs"));
    if (response.statusCode == 200) {
      setState(() {
        Map mapResponse = json.decode(response.body);
        data = Map.from(mapResponse!);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc8e6c9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  '${data['avatar_url']}',
                  height: 180,
                  width: 180,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              data['name'],
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const MyWidget();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
              ),
              child: const Text('Enter'),
            )
          ],
        ),
      ),
    );
  }
}
