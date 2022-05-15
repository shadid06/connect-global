import 'package:connect_global/screen/add_address_screen.dart';
import 'package:connect_global/screen/show_data.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("WELCOME"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddAddressPage()));
                          },
                          icon: Icon(
                            Icons.record_voice_over,
                            size: 80,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Save")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowData()));
                          },
                          icon: Icon(
                            Icons.shower_outlined,
                            size: 80,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Text("show")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
