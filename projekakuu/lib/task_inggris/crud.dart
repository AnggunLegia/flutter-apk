import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pengiriman/navAlamat.dart';
import 'package:uuid/uuid.dart';

class pageAlamatTask extends StatefulWidget {
  const pageAlamatTask({super.key});

  @override
  State<pageAlamatTask> createState() => _pageAlamatTaskState();
}

class _pageAlamatTaskState extends State<pageAlamatTask> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _namapenerima = TextEditingController();
  final TextEditingController _notelp = TextEditingController();
  final TextEditingController _kategorialmat= TextEditingController();
  final TextEditingController _alamatlengkap = TextEditingController();

  formaddress() async{
    try{
      var uuid = Uuid();
      String id = uuid.v4();
      await FirebaseFirestore.instance.collection("alamat").doc(id).set({
        "uid": id,
        "nama penerima": _namapenerima.text,
        "notelp" : _notelp.text,
        "alamat lengkap":_alamatlengkap.text,
        "kategori alamat": _kategorialmat.text
      });
      Navigator.push(context, MaterialPageRoute(builder: (_) => pageNavAlamat()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 25),
          child: Text("Add Address",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
          ),
        ),

        toolbarHeight: 60,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(
                left: 20, right: 20, bottom: 10, top: 30
              ),
              child: TextFormField(
                controller: _namapenerima,
                maxLength: 20,
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'nama penerima kosong';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "example: budiansyah",
                  labelText: "recipient's name",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  filled: true,fillColor: Colors.white
                ),
              ),
              ),
              Padding(padding: EdgeInsets.only(
                left: 20, right: 20, bottom: 10, top: 30
              ),
              child: TextFormField(
                controller: _notelp,
                maxLength: 12,
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'phone number is empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "example: 08xxxxxxxx",
                  labelText: "phone number",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  filled: true,fillColor: Colors.white
                ),
              ),
              ),
              Padding(padding: EdgeInsets.only(
                left: 20, right: 20, bottom: 10, top: 30
              ),
              child: TextFormField(
                controller: _alamatlengkap,
                
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'complete address is empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "example: barged rt/rw 04/09",
                  labelText: "complete address",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  filled: true,fillColor: Colors.white
                ),
              ),
              ),
              Padding(padding: EdgeInsets.only(
                left: 20, right: 20, bottom: 10, top: 30
              ),
              child: TextFormField(
                controller: _kategorialmat,
                
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'address category is empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "example: home",
                  labelText: "address category",
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 2, color: Colors.black),
                  ),
                  filled: true,fillColor: Colors.white
                ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20
                ),
                height: 50,
                width: 365,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  onPressed:() {
                    if (_formkey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("data added successfully")),
                      );
                      formaddress();
                    }
                  },  
                  child: Text("add address",
                  style: TextStyle(
                    fontSize: 20, color: Colors.white,
                  ),
                  )),
              )
            ],
          ),
        )),
      
    );
  }
}