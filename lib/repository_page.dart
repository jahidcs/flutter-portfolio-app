import 'package:flutter/material.dart';
import 'package:github_api_portfolio/views/tabs/profile_page.dart';
import 'package:github_api_portfolio/optional.dart';
import 'package:github_api_portfolio/repo_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List dataList = [];
  Future apicall() async {
    http.Response response;
    response =
        await http.get(Uri.parse("https://api.github.com/users/jahidcs/repos"));
    if (response.statusCode == 200) {
      setState(() {
        dataList = json.decode(response.body);
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
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: const Text('All Repository'),
        centerTitle: true,
        backgroundColor: const Color(0xffc8e6c9),
        foregroundColor: Colors.black87,
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xffc8e6c9),
                ),
                child: ListTile(
                  onTap: () {},
                  title: const Text(
                    "Portfolio",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.search),
                title: const Text('Search user'),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ProfileWidget();
                      },
                    ),
                  );
                },
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Exit'),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < dataList.length; i++)
              GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return RepoPage(
                          rname: dataList[i]['name'],
                        );
                      },
                    ),
                  );
                }),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.5, vertical: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text('${dataList[i]['name']}'),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
