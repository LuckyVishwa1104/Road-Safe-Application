import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:road_safe_app/config.dart';
import 'package:road_safe_app/utils/app_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class my_complaint extends StatefulWidget {
  final token;
  const my_complaint({@required this.token, Key? key}) : super(key: key);

  @override
  State<my_complaint> createState() => _my_complaintState();
}

class _my_complaintState extends State<my_complaint> {
  List? items;

  late String email;
  late String Uid;

  @override
  void initState() {
    super.initState();

    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken['email'];
    print("my_complaints");
    print(email);
    Uid = jwtDecodedToken['_id'];
    print("my_complaints");
    print(Uid);
    getComplaintDetails(email);
  }

  void getComplaintDetails(email) async {
    var reqBody = {"email": email};

    var response = await http.post(Uri.parse(getComplaintData),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody));

    var jsonResponse = jsonDecode(response.body);

    items = jsonResponse['success'];
    print("below is response body");
    print(jsonResponse);
    print("below is items body");
    print(items);

    setState(() {});
  }

  void deleteItem(id) async {
    var reqBody = {"id": id};

    var response = await http.post(Uri.parse(deleteComplaints),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody));

    var jsonResponse = jsonDecode(response.body);

    print(jsonResponse);

    if (jsonResponse['status']) {
      getComplaintDetails(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Complaint Status"),
            backgroundColor: Colors.amber),
        drawer: const AppDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Complaint will be resolved soon!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: items == null
                      ? null
                      : ListView.builder(
                          itemCount: items!.length,
                          itemBuilder: (context, int index) {
                            return Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                dismissible:
                                    DismissiblePane(onDismissed: () {
                                      deleteItem('${items![index]['_id']}');
                                    }),
                                children: [
                                  SlidableAction(
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                    onPressed: (BuildContext context) {
                                      print('${items![index]['_id']}');
                                      deleteItem('${items![index]['_id']}');
                                    },
                                  ),
                                ],
                              ),
                              child: Card(
                                // borderOnForeground: false,
                                child: ListTile(
                                  leading: Icon(Icons.task),
                                  title: Text('${items![index]['_id']}'),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email : ${items![index]['email']}'),
                                      Text('Image : ${items![index]['image']}'),
                                      Text('Address : ${items![index]['location']}'),
                                      Text('Category : ${items![index]['category'][0]}'),
                                      Text('Description : ${items![index]['description']}'),
                                      Text('Date : ${items![index]['createdAt']}'),
                                    ],
                                  ),
                                  trailing: Icon(Icons.arrow_back),
                                ),
                              ),
                            );
                          }),
                ),
              ),
            )
          ],
        )
        );
  }
}
