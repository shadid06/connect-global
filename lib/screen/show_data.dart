import 'package:connect_global/model/add_address_model.dart';
import 'package:connect_global/services/local_db_helper.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<AddAddressModel> addresses = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddresse();
  }

  getAddresse() async {
    var ad = await DBHelper().getAddresses();
    setState(() {
      addresses = ad;
    });
    return ad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: Text("show data"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: 310,
            child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    width: double.infinity,
                    color: Colors.lightBlueAccent,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(addresses[index].city!),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(addresses[index].fname!),
                            SizedBox(
                              width: 5,
                            ),
                            Text(addresses[index].lname!),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(addresses[index].mobileNo!),
                        SizedBox(
                          height: 10,
                        ),
                        Text(addresses[index].houseNo!),
                      ],
                    ),
                  );
                }),
          ),
        ),
      )),
    );
  }
}
