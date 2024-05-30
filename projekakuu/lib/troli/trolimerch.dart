import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/merch_page/merch_page.dart';
import 'package:flutter_application_2/troli/cekotmerh.dart';
import 'package:flutter_application_2/troli/trolitiket.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../detail/detailmerch.dart';
import '../pengiriman/navAlamat.dart';
import '../pengiriman/navAlamatTik.dart';

class trolimerch extends StatefulWidget {
  const trolimerch({Key? key});

  @override
  State<trolimerch> createState() => _trolimerchState();
}

class _trolimerchState extends State<trolimerch> {
  final _userStream =
      FirebaseFirestore.instance.collection("trolimerch").snapshots();

  int formatHarga(String harga, int jumlah) {
    harga = harga.replaceAll('.', '');
    int hargaInt = int.parse(harga);
    return hargaInt * jumlah;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(202, 31, 31, 1)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[350]),
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
                      int harga = int.parse(doc[index]["harga"]);
                      int jumlah = doc[index]["jumlah"];
                      int totalHarga = formatHarga(doc[index]["harga"], jumlah);
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
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 160,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => pageMerch(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 5, left: 10, right: 10),
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(doc[index]["assets"]),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
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
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 100, bottom: 50),
                                              child: Text(
                                                "IDR $totalHarga",
                                                style: GoogleFonts.radioCanada(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
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
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      int jumlah = doc[index]["jumlah"];
                                                      if (jumlah > 1) {
                                                        jumlah--;
                                                        FirebaseFirestore.instance
                                                            .collection("trolimerch")
                                                            .doc(doc[index].id)
                                                            .update({"jumlah": jumlah});
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.minimize_rounded,
                                                    color: Colors.black,
                                                    size: 15,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  doc[index]["jumlah"].toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      int jumlah = doc[index]["jumlah"] + 1;
                                                      FirebaseFirestore.instance
                                                          .collection("trolimerch")
                                                          .doc(doc[index].id)
                                                          .update({"jumlah": jumlah});
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                    size: 15,
                                                  ),
                                                ),
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
                            GestureDetector(
                              onTap: () {
                                // FirebaseFirestore.instance
                                //     .collection("trolimerch")
                                //     .doc(doc[index].id)
                                //     .update({
                                //   "jumlah": jumlah,
                                //   "harga": totalHarga.toString(),
                                
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detailekot(
                                      id: doc[index]["id"],
                                      assets: doc[index]["assets"],
                                      judul: doc[index]["judul"],
                                      jumlah: doc[index]["jumlah"].toString(),
                                      harga: doc[index]["harga"],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 320, top: 5, bottom: 5),
                                      padding: EdgeInsets.only(left: 10, top: 5),
                                      width: 70,
                                      height: 25,
                                      child: Text(
                                        "Pesan",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(202, 31, 31, 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
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
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
