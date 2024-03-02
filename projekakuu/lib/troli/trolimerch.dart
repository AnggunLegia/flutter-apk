import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/troli/cekotmerh.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pengiriman/navAlamat.dart';
import '../pengiriman/navAlamatTik.dart';

class trolimerch extends StatefulWidget {
  const trolimerch({super.key});

  @override
  State<trolimerch> createState() => _trolimerchState();
}

class _trolimerchState extends State<trolimerch> {
   final _userStream =
      FirebaseFirestore.instance.collection("trolimerch").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Check Out",
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(202, 31, 31, 1)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(

                children: [
                  GestureDetector(
                    child: Container(
                      width: 70,
                      height: 30,
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.only(left: 30, right: 80, top: 15, bottom: 15),
                      child: Text(
                        "Merch",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => pageNavAlamat()));
                    },
                  ),
                  GestureDetector(
                    child: Container(
                      width: 70,
                      height: 30,
                      padding: EdgeInsets.only(left: 10),
                      margin: EdgeInsets.only(right: 10, left: 80, top: 15, bottom: 15),
                      child: Text(
                        "Ticket",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => pageNavAlamatTik()));
                    },
                  )
                ],
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
                        builder: (context) => detailekot(
                              id: doc[index]["id"],
                              assets: doc[index]["assets"],
                              judul: doc[index]["judul"],
                              jumlah: doc[index]["jumlah"].toString(),
                              harga: doc[index]["harga"],
                              
                              //  jumlah: 1
                            )));
                           
                          },
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 160,
                                decoration: BoxDecoration(
                                  color: Colors.white60,
                                  
                                ),
                                child:  Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                                image: NetworkImage(doc[index]["assets"]),
                                fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    child: Column(
                      children: [
                        Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                      bottom: 10, right: 40, left: 5),
                                  child: Text(
                                    doc[index]["judul"],
                                    style: GoogleFonts.radioCanada(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                        ),
                        Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 100, bottom: 50),
                                  child: Text(
                                    "IDR " + doc[index]["harga"],
                                    style: GoogleFonts.radioCanada(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                        ),
                        Container(
                              height: 40,
                              width: 100,
                              margin: EdgeInsets.only(left: 50),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.minimize_rounded,
                                          color: Colors.black,
                                          size: 15,
                                        )),
                                  ),
                                  Container(
                                    child: Text(
                                      doc[index]["jumlah"].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 15,
                                        )),
                                  ),
                                ],
                              ),
                        ),
                        
                      ],
                    ),
                  )
                ],
              ),
                              ),
                              
                               Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[350]),
            ),

                            ],
                          ),
                          
                        );
                        }
                        
                    );
                  }
                  return CircularProgressIndicator();
                }
              )
          ],
        ),
      ),
    );
  }
}