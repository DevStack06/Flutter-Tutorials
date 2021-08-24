import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterapps/RestAPI/post_model.dart';
import 'package:http/http.dart' as http;

class RestAPI extends StatefulWidget {
  RestAPI({Key? key}) : super(key: key);

  @override
  _RestAPIState createState() => _RestAPIState();
}

class _RestAPIState extends State<RestAPI> {
  IndividualPost individualPost = IndividualPost();
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    var response = await http.get(url);
    setState(() {
      individualPost = IndividualPost.fromJson(json.decode(response.body));
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(individualPost.body!),
                SizedBox(
                  height: 20,
                ),
                Text(individualPost.title!),
              ],
            ),
    );
  }
}
