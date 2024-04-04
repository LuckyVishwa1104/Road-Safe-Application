import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:road_safe_app/utils/app_drawer.dart';

class my_complaint extends StatefulWidget {
  final token;
  const my_complaint({@required this.token, Key? key}) : super(key: key);

  @override
  State<my_complaint> createState() => _my_complaintState();
}

class _my_complaintState extends State<my_complaint> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Complaint Status"), backgroundColor: Colors.amber),
      drawer: const AppDrawer(),
      body:
        SingleChildScrollView(
          child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Complaint will be displayed here.",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          )
        ),
    )
    );
  }
}
