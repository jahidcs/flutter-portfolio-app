import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RepoPage extends StatefulWidget {
  const RepoPage({
    super.key,
    required this.rname,
  });

  final String rname;

  @override
  State<RepoPage> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  Map dataList = {};
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://api.github.com/repos/jahidcs/${widget.rname}"));
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
          title: Text(widget.rname),
          centerTitle: true,
          backgroundColor: const Color(0xffc8e6c9),
          foregroundColor: Colors.black87,
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: 110.0,
            margin: const EdgeInsets.symmetric(
              horizontal: 10.5,
              vertical: 5.0,
            ),
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
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: Text(
                      dataList['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    subtitle: Text(dataList['language']),
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffc8e6c9),
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Visit Repository'))
                ],
              ),
            ),
          ),
        ));
  }
}
