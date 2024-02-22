import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pengiriman/navAlamatTik.dart';
import 'package:flutter_application_2/profile/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import 'navAlamat.dart';

class pageDetailAlamatTik extends StatefulWidget {
  const pageDetailAlamatTik(
      {super.key,
      required this.namaPenerima,
      required this.email, required this.id,
     });
  final String id;
  final String namaPenerima,
      email
      ;

  @override
  State<pageDetailAlamatTik> createState() => _pageDetailAlamatTikState();
}

class _pageDetailAlamatTikState extends State<pageDetailAlamatTik> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _namapenerima = TextEditingController();
  TextEditingController _email = TextEditingController();
  

  formalamat() async {
    try {
      
      await FirebaseFirestore.instance
          .collection("alamatTik")
          .doc(widget.id)
          .update({
        
        "nama penerima": _namapenerima.text,
        "email": _email.text,
        
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => pageNavAlamatTik()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _namapenerima = TextEditingController(text: widget.namaPenerima);
    _email = TextEditingController(text: widget.email);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(
            "UPDATE ALAMAT",
            style: GoogleFonts.radioCanada(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                color: Colors.black),
          ),
          margin: EdgeInsets.only(left: 25),
        ),
        toolbarHeight: 60,
      ),
      body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 10, top: 30),
                  child: TextFormField(
                    controller: _namapenerima,
                    maxLength: 20,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Penerima kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Contoh: budiansyah",
                      labelText: "Nama Penerima",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      //  icon: Icon(Icons.apartment_rounded),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(width: 2, color: Colors.black)),

                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'No Telepon kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Contoh: 083xxx",
                      labelText: "No Telepon",
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      //  icon: Icon(Icons.apartment_rounded),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(width: 2, color: Colors.black)),

                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  height: 50,
                  width: 365,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('alamatTik')
                          .doc(widget.id)
                          .delete();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => pageNavAlamatTik())));
                      //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
                      //   _formkey.currentState!.validate();
                    },
                    child: Text(
                      "HAPUS ALAMAT",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  height: 50,
                  width: 365,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Data berhasil ditambahkan")),
                        );
                        formalamat();
                      }
                      //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
                      //   _formkey.currentState!.validate();
                    },
                    child: Text(
                      "UPDATE ALAMAT",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
