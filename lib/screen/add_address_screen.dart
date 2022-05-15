import 'package:connect_global/model/add_address_model.dart';
import 'package:connect_global/screen/show_data.dart';
import 'package:connect_global/services/local_db_helper.dart';
import 'package:connect_global/widget/rounded_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddAddressPage extends StatefulWidget {
  var id;
  AddAddressPage({this.id});

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController firstNameCtlr = new TextEditingController();
  TextEditingController lastNameCtlr = new TextEditingController();
  TextEditingController roadNoCtlr = new TextEditingController();
  TextEditingController houseNoCtlr = new TextEditingController();
  TextEditingController mobileNoCtlr = new TextEditingController();
  bool showBtn = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // readCity();
    // readFirstName();
    //readText();

    // if (widget.id != null) {
    //   DBHelper.getAddressById(widget.id).then((model) {
    //     //print(model);
    //     firstNameCtlr.text = model.fname.toString();
    //     lastNameCtlr.text = model.lname.toString();
    //     //roadNoCtlr.text = model.roadNo.toString();
    //     houseNoCtlr.text = model.houseNo.toString();
    //     mobileNoCtlr.text = model.mobileNo.toString();
    //   });
    // }
  }

  String? valueChoose;

  List listItem = ['Hospital', 'Police', 'Bank'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(
            //     context, MaterialPageRoute(builder: (context) => ToShip()));
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.grey,
            size: 22,
          ),
        ),
        title: Text(
          "Add Address",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SafeArea(
            child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                    child: DropdownButton(
                        value: valueChoose,
                        hint: Text(
                          'Select',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: Icon(
                          Icons.expand_more,
                          color: Colors.grey,
                        ),
                        items: listItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue.toString();
                          });
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'First Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      controller: firstNameCtlr,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "First Name is Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Last Name',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      controller: lastNameCtlr,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Last Name is Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Address',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      controller: houseNoCtlr,
                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      maxLines: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter your address";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Mobile No',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black26, width: 1.5),
                    //   borderRadius: BorderRadius.circular(16),
                    // ),
                    child: TextFormField(
                      controller: mobileNoCtlr,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty && value.length < 11) {
                          return "Enter correct Mobile Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: RoundedButton(
            buttonText: "Add Address",
            func: () async {
              //print(valueChoose);
              if (formKey.currentState!.validate()) {
                // CustomSnackbar.snackbar(context, 'Address Added');

                await DBHelper().saveToAddressList(AddAddressModel(
                    city: valueChoose,
                    fname: firstNameCtlr.text,
                    lname: lastNameCtlr.text,
                    houseNo: houseNoCtlr.text,
                    mobileNo: mobileNoCtlr.text));

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowData()));
                //  else {
                //   await DBHelper().updateAddres(AddAddressModel(
                //       id: widget.id,
                //       city: valueChoose,
                //       fname: firstNameCtlr.text,
                //       lname: lastNameCtlr.text,
                //       houseNo: houseNoCtlr.text,
                //       mobileNo: mobileNoCtlr.text));
                // }
              }

              // update();
              //print(AddAddressModel.fromJson());
            }),
      ),
    );
  }
}
