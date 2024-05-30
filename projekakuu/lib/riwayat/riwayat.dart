import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/riwayat/detail.dart';
import 'package:google_fonts/google_fonts.dart';

class riwayatpembelian extends StatefulWidget {
  const riwayatpembelian({super.key});

  @override
  State<riwayatpembelian> createState() => _riwayatpembelianState();
}

class _riwayatpembelianState extends State<riwayatpembelian> {
  final _userStream =
      FirebaseFirestore.instance.collection("pembelian").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          "Riwayat Pesanan",
          style: TextStyle(fontSize: 25, color: Color.fromRGBO(202, 31, 31, 1)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        builder: (context) => detailriwayat(
                              waktu_pembelian: doc[index]["waktu_pembelian"].toString(),
                              id_pembelian: doc[index]["id_pembelian"],
                              assets: doc[index]["assets"],
                              judul: doc[index]["judul"],
                              jumlah: doc[index]["jumlah"].toString(),
                              harga: doc[index]["harga"].toString(),
                              alamat_penerima1: doc[index]["alamat_penerima1"],
                              nama_penerima1: doc[index]["nama_penerima1"],
                              kategori_alamat1: doc[index]["kategori_alamat1"],
                              notelp1: doc[index]["no_telp1"],
                              //  jumlah: 1
                            )));
                           
                              },
                              child: Column(
                                children: [
                                   Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 4,
                                    margin: EdgeInsets.only(top:10, bottom: 10),
                                    decoration: BoxDecoration(color: Colors.grey[350]),
                                  ),
                                   Container(
              child: Row(
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
                                "IDR " + doc[index]["harga"].toString(),
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
                              
                              Container(
                                child: Text(
                                  "Qty: "+ doc[index]["jumlah"].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
                                ],
                              )
                             
                          );
                        }
                    );
                  }
                   return CircularProgressIndicator();
                }
            ),
                          
          ],
        ),
      ),
    );
  }
}