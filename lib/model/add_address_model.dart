class AddAddressModel {
  int? id;
  String? city;
  String? fname;
  String? lname;
  //String? roadNo;
  String? houseNo;
  String? mobileNo;

  AddAddressModel(
      {this.id,
      this.city,
      this.fname,
      this.lname,
      // this.roadNo,
      this.houseNo,
      this.mobileNo});

  AddAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    fname = json['fname'];
    lname = json['lname'];
    //roadNo = json['roadNo'];
    houseNo = json['houseNo'];
    mobileNo = json['mobileNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    //data['roadNo'] = this.roadNo;
    data['houseNo'] = this.houseNo;
    data['mobileNo'] = this.mobileNo;
    return data;
  }
}
