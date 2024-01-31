import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/pengiriman/alamat.dart';
import 'package:flutter_application_2/pengiriman/detailAlamat.dart';
import 'package:google_fonts/google_fonts.dart';

class pageNavAlamat extends StatefulWidget {
  const pageNavAlamat({
    super.key,
  });

  @override
  State<pageNavAlamat> createState() => _pageNavAlamatState();
}

class _pageNavAlamatState extends State<pageNavAlamat> {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pageAlamat()));
                },
              ),
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
                                        builder: (context) => pageDetailAlamat(
                                              id: doc[index]['uid'],
                                              namaPenerima: doc[index]
                                                  ['nama penerima'],
                                              notelp: doc[index]['notelp'],
                                              provinsi: doc[index]['provinsi'],
                                              kota: doc[index]['kota'],
                                              kecamatan: doc[index]
                                                  ['kecamatan'],
                                              desa: doc[index]['desa'],
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
                                                            left: 70,
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
                                                                  .only(top: 1),
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
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 1),
                                                              child: Text(
                                                                '${doc[index]['desa']},',
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
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 1),
                                                              child: Text(
                                                                '${doc[index]['provinsi']},',
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
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 1),
                                                              child: Text(
                                                                '${doc[index]['kota']},',
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
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(top: 1),
                                                              child: Text(
                                                                '${doc[index]['kecamatan']}',
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
