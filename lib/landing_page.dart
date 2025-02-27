import 'package:flutter/material.dart';
class landing_page extends StatefulWidget {
  const landing_page({super.key});

  @override
  State<landing_page> createState() => _landing_pageState();
}

class _landing_pageState extends State<landing_page> {
  TextEditingController user1 = TextEditingController();
  TextEditingController user2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextField(
                controller: user1,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: 'user 1'),
              ),
              TextField(
                controller: user2,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(hintText: 'user 2'),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
