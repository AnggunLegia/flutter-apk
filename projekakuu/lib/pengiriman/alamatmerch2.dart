import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pengiriman/alamat.dart';
import 'package:flutter_application_2/pengiriman/alamatmerh.dart';
import 'package:flutter_application_2/pengiriman/alamatnav2.dart';
import 'package:flutter_application_2/pengiriman/detailAlamat.dart';
import 'package:flutter_application_2/pengiriman/editalamat.dart';
import 'package:flutter_application_2/pengiriman/selectTambah.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profile/profile.dart';
import 'navAlamatTik.dart';

class pageNavAlamatRincian extends StatefulWidget {
  const pageNavAlamatRincian({
    super.key, required this.id, required this.Asset, required this.Judul, required this.Menit,
  });
   final String id;
  final String Asset, Judul, Menit;
  @override
  State<pageNavAlamatRincian> createState() => _pageNavAlamatRincianState();
}

class _pageNavAlamatRincianState extends State<pageNavAlamatRincian> {
  final _userStream =
      FirebaseFirestore.instance.collection("alamat").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                child: Text(
                  "Alamat Pengiriman",
                  style: GoogleFonts.radioCanada(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      color: Color.fromRGBO(202, 31, 31, 1)),
                ),
                margin: EdgeInsets.only(left: 20),
              ),
            ],
          ),
          // leading: BackButton(
          //   color: Color.fromRGBO(202, 31, 31, 1),
          //   onPressed: () {
          //     // Navigator.push(context,
          //     //     MaterialPageRoute(builder: (context) => pageProfile()));
          //   },
          // ),
          toolbarHeight: 60,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  width: 320,
                  height: 100,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60, top: 25),
                    child: Text(
                      "+ Tambah Alamat",
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 3,
                          color: const Color.fromARGB(255, 80, 78, 78)),
                      borderRadius: BorderRadius.circular(10)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => pageAlamatNav2(
                          Asset: widget.Asset,
                          Judul: widget.Judul,
                          Menit: widget.Menit,
                          id: widget.id,
                          )));
                },
              ),
              // Row(
              //   children: [
              //     GestureDetector(
              //       child: Container(
              //         width: 70,
              //         height: 30,
              //         padding: EdgeInsets.only(left: 10),
              //         margin: EdgeInsets.only(left: 30, right: 80),
              //         child: Text(
              //           "Merch",
              //           style: TextStyle(
              //               fontSize: 20,
              //               color: Colors.black,
              //               fontWeight: FontWeight.w600),
              //         ),
              //         decoration: BoxDecoration(
              //             color: Colors.grey[350],
              //             borderRadius: BorderRadius.circular(5)),
              //       ),
              //       onTap: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (_) => pageNavAlamatRincian()));
              //       },
              //     ),
              //     GestureDetector(
              //       child: Container(
              //         width: 70,
              //         height: 30,
              //         padding: EdgeInsets.only(left: 10),
              //         margin: EdgeInsets.only(right: 10, left: 80),
              //         child: Text(
              //           "Ticket",
              //           style: TextStyle(
              //               fontSize: 20,
              //               color: Colors.black,
              //               fontWeight: FontWeight.w600),
              //         ),
              //         decoration: BoxDecoration(
              //             color: Colors.grey[350],
              //             borderRadius: BorderRadius.circular(5)),
              //       ),
              //       onTap: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (_) => pageNavAlamatTik()));
              //       },
              //     )
              //   ],
              // ),
              StreamBuilder(
                stream: _userStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var doc = snapshot.data!.docs;
                    return ListView.builder(
                        itemCount: doc.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => pageDetailAlamat2(
                                        Asset: widget.Asset,
                                        Judul: widget.Judul,
                                        Menit: widget.Menit,
                                        uid: widget.id,
                                              id: doc[index]['uid'],
                                              namaPenerima: doc[index]
                                                  ['nama penerima'],
                                              notelp: doc[index]['notelp'],
                                              
                                              alamatlengkap: doc[index]
                                                  ['alamat lengkap'],
                                              kategoriAlamat: doc[index]
                                                  ['kategori alamat'],
                                            )));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20),
                                    height: 150,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          spreadRadius: 5,
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        // Icon(Icons.location_on_outlined, size:20,
                                        // color: Colors.black,),
                                        Column(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  top: 10),
                                                          child: Text(
                                                            doc[index][
                                                                "nama penerima"],
                                                            style: GoogleFonts.radioCanada(
                                                                textStyle: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayLarge,
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10,
                                                            left: 40,
                                                            right: 1),
                                                        child: Text(
                                                          doc[index]["notelp"],
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 1,
                                                                      left: 20),
                                                              child: Text(
                                                                '${doc[index]['alamat lengkap']}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        
                                                        Container(
                                                          child: Text(
                                                            '${doc[index]['kategori alamat']}',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                   GestureDetector(
                                    onTap: () {
                                       Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => rincianmerchAlamat(
                                              id_alamat: doc[index]['uid'],
                                              namaPenerima: doc[index]
                                                  ['nama penerima'],
                                              notelp: doc[index]['notelp'],
                                              
                                              alamatlengkap: doc[index]
                                                  ['alamat lengkap'],
                                              kategoriAlamat: doc[index]
                                                  ['kategori alamat'],
                                                  Asset: widget.Asset,
                                                  Judul: widget.Judul,
                                                  Menit: widget.Menit,
                                                  id: widget.id,
                                            )));
                                    },
                                     child: Container(
                                         child: Row(
                                         children: [
                                       Container(
                                          margin: EdgeInsets.only(left:320, top: 5, bottom: 5 ),
                                          padding: EdgeInsets.only(left: 10, top: 5),
                                          width: 70,
                                          height: 25,
                                          child: Text("Gunakan Alamat", 
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12
                                          ),),
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(202, 31, 31, 1),
                                            borderRadius: BorderRadius.circular(10)
                                          ) ,
                                        ),
                                      
                                                                     ],
                                                                   ),
                                                                 ),
                                   ),
                                ],
                              ));
                        });
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ));
  }
}
