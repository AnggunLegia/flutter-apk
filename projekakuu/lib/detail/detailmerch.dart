import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/merch_page/merch_page.dart';
import 'package:flutter_application_2/rincian_pesanan/rincianmerch.dart';
import 'package:google_fonts/google_fonts.dart';

class detailmerch extends StatefulWidget {
  const detailmerch({
    super.key,
    required this.Asset,
    required this.Deskripsi,
    required this.Judul,
    required this.id,
    required this.Menit,
    required this.Stok,
  });
  final String id;
  final String Asset, Deskripsi, Judul, Menit, Stok;
  

  @override
  State<detailmerch> createState() => _detailmerchState();
}

class _detailmerchState extends State<detailmerch> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _troli() async {
    try {
     
        await _firestore.collection('trolimerch').add({
          'judul' : widget.Judul,
          'assets' : widget.Asset,
          'harga': widget.Menit,
          'jumlah': 1 ,
          'waktu_pembelian': DateTime.now(),
          'id': widget.id
        });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sukses menambahkan ke troli')),)
       ;
     
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan, silakan coba lagi')),
      );
    }
  }
 Future<void> _beli() async {
    try {
     
        await _firestore.collection('belilangsung').add({
          'judul' : widget.Judul,
          'assets' : widget.Asset,
          'harga': widget.Menit,
          'jumlah': 1 ,
          'waktu_pembelian': DateTime.now(),
          'id': widget.id
        });
        await FirebaseFirestore.instance.collection('belilangsung').doc('id').get();
         Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => rincianmerch(
                              id: widget.id,
                              Asset: widget.Asset,
                              Judul: widget.Judul,
                              Menit: widget.Menit,
                              
                              //  jumlah: 1
                            )));
              
       ;
     
      
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan, silakan coba lagi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.chat_rounded,
                  size: 35,
                  color: Color.fromRGBO(202, 31, 31, 1),
                )),
            GestureDetector(
              child: Container(
                width: 120,
                 margin: EdgeInsets.only(right: 10, left: 10),
                   
                      padding: EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                      color: Colors.amber[600],
                      borderRadius: BorderRadius.circular(15),
                    ),
               
                   
                   
                      child: Text(
                        "BELI SEKARANG",
                        style: GoogleFonts.radioCanada(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                  
                    
                  
                    
                    
                
                
                ),
                onTap:() {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => rincianmerch(
                              id: widget.id,
                              Asset: widget.Asset,
                              Judul: widget.Judul,
                              Menit: widget.Menit,
                              
                              //  jumlah: 1
                            )));
                },
              ),
          
            GestureDetector(
              child: Container(
                height: 35,
                width: 130,
               
                  padding: EdgeInsets.only(top: 10, left: 10),
                  
                    child: Text(
                      "TAMBAH KE TROLI",
                      style: GoogleFonts.radioCanada(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  
              
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onTap: _troli,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 412,
              height: 320,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.Asset), fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => pageMerch()));
                            },
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              size: 30,
                              color: Color.fromRGBO(202, 31, 31, 1),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 6, top: 10, bottom: 5),
                  child: Text(
                    widget.Judul,
                    style: GoogleFonts.radioCanada(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 6, bottom: 5),
                  child: Text(
                    "IDR." + widget.Menit,
                    style: GoogleFonts.radioCanada(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5, left: 6),
                  child: Text(
                    "Stok " + widget.Stok,
                    style: GoogleFonts.radioCanada(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 10,
                        color: const Color.fromARGB(255, 133, 129, 129)),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[350]),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 5, left: 6),
                        child: Text(
                          "Pengiriman",
                          style: GoogleFonts.radioCanada(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          margin:
                              EdgeInsets.only(right: 270, bottom: 5, left: 5),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 18,
                          )),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Alamat",
                          style: GoogleFonts.radioCanada(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(right: 217, bottom: 6, left: 5),
                          child: Text(
                            "Standar",
                            style: GoogleFonts.radioCanada(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            "Rp 18.000",
                            style: GoogleFonts.radioCanada(
                                textStyle:
                                    Theme.of(context).textTheme.displayLarge,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[350]),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 6),
                  child: Text(
                    "Deskripsi",
                    style: GoogleFonts.radioCanada(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 6),
                  child: Text(
                    widget.Deskripsi,
                    style: GoogleFonts.radioCanada(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
