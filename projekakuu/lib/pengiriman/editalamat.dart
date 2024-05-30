import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pengiriman/alamatmerch2.dart';
import 'package:flutter_application_2/pengiriman/alamatnav2.dart';
import 'package:flutter_application_2/profile/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import 'navAlamat.dart';

class pageDetailAlamat2 extends StatefulWidget {
  const pageDetailAlamat2(
      {super.key,
      required this.namaPenerima,
      required this.notelp,
      
      required this.id,
      
      required this.alamatlengkap,
      required this.kategoriAlamat, required this.Asset, required this.Judul, required this.Menit, required this.uid});
  final String id;
  final String namaPenerima,
      notelp,
     
      alamatlengkap,
      kategoriAlamat;
      final String uid;
  final String Asset, Judul, Menit;

  @override
  State<pageDetailAlamat2> createState() => _pageDetailAlamat2State();
}

class _pageDetailAlamat2State extends State<pageDetailAlamat2> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _namapenerima = TextEditingController();
  TextEditingController _notelp = TextEditingController();
  
  TextEditingController _alamatlengkap = TextEditingController();
  TextEditingController _kategorialmat = TextEditingController();

  formalamat() async {
    try {
      
      await FirebaseFirestore.instance
          .collection("alamat")
          .doc(widget.id)
          .update({
        
        "nama penerima": _namapenerima.text,
        "notelp": _notelp.text,
       
        "alamat lengkap": _alamatlengkap.text,
        "kategori alamat": _kategorialmat.text,
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => pageNavAlamatRincian(
           Asset: widget.Asset,
            Judul: widget.Judul,
            Menit: widget.Menit,
            id: widget.id,
          )));
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
    _notelp = TextEditingController(text: widget.notelp);
    _alamatlengkap = TextEditingController(text: widget.alamatlengkap);
    _kategorialmat = TextEditingController(text: widget.kategoriAlamat);

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
                    controller: _notelp,
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: TextFormField(
                    controller: _alamatlengkap,
                    maxLines: 3,
                    maxLength: 200,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat Lengkap kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Contoh: rumah no. xx, rt/rw 02/03",
                      labelText: "alamat Lengkap",
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
                    controller: _kategorialmat,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Kategori kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Contoh: Rumah/Kantor",
                      labelText: "Kategori Alamat",
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
                          .collection('alamat')
                          .doc(widget.id)
                          .delete();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => pageNavAlamatRincian(
                              Asset: widget.Asset,
                              Judul: widget.Judul,
                              Menit: widget.Menit,
                              id: widget.id,
                              ))));
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
