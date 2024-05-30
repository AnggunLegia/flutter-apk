import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail/detailmerch.dart';
import 'package:flutter_application_2/merch_page/merch_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home.dart';
import 'alamatmerch2.dart';

class rincianmerchAlamat extends StatefulWidget {
  const rincianmerchAlamat({
    super.key,
    required this.Asset,
    required this.Judul,
    required this.id,
    required this.Menit,
    required this.namaPenerima,
      required this.notelp,
      
      required this.id_alamat,
      
      required this.alamatlengkap,
      required this.kategoriAlamat
  });
  final String id;
  final String Asset, Judul, Menit;
  final String id_alamat;
  final String namaPenerima,
      notelp,
     
      alamatlengkap,
      kategoriAlamat;

  @override
  State<rincianmerchAlamat> createState() => _rincianmerchAlamatState();
}

class _rincianmerchAlamatState extends State<rincianmerchAlamat> {
  int jumlahBarang = 1; // Variabel untuk menyimpan jumlah barang yang dipilih
  int hargaPerBarang = 0; // Harga per barang

   void initState() {
    super.initState();
    // Inisialisasi harga per barang saat widget pertama kali dibuat
    hargaPerBarang = int.parse(widget.Menit);
  }

   String _getCurrentTime() {
    var time = DateTime.now();

    return "${time.day.toString().padLeft(2, '0')}-${time.month.toString().padLeft(2, '0')}-${time.year.toString().padLeft(2, '0')},${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //  Future<void> _deleteData(BuildContext context) async {
  //   try {
      
  //     await FirebaseFirestore.instance.collection('belilangsung').doc(widget.id).delete();
  //     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: ((context) => pageMerch())));
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Data berhasil dihapus'),
  //       ),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error: $e'),
  //       ),
  //     );
  //   }
  // }

  final _userStream =
      FirebaseFirestore.instance.collection("belilangsung").snapshots();
      
  @override
  
  Widget build(BuildContext context) {
    
     int ongkir = 18000;
     int total = hargaPerBarang * jumlahBarang;
    int totalHarga = total + ongkir ;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          children: [
            Container(
              height: 35,
              margin: EdgeInsets.only(right: 10, left: 10),
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 14),
                child: Text(
                  "Total",
                  style: GoogleFonts.radioCanada(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 35,
              margin: EdgeInsets.only(left: 10),
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 14),
                child: Text(
                  "IDR $totalHarga",
                  style: GoogleFonts.radioCanada(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                height: 35,
                width: 110,
                margin: EdgeInsets.only(left: 50),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 14),
                  child: Text(
                    "Check Out",
                    style: GoogleFonts.radioCanada(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.red[800],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onTap:() async {
                 try {
     
        await _firestore.collection('pembelian').add({
          'judul' :widget.Judul,
          'assets' :widget.Asset,
          'harga': totalHarga,
          'jumlah': jumlahBarang , 
          'waktu_pembelian': _getCurrentTime(),
          'kategori': "merch",
          'id_pembelian': widget.id,
          'nama_penerima1': widget.namaPenerima,
          'alamat_penerima1': widget.alamatlengkap,
          'no_telp1': widget.notelp,
          'kategori_alamat1': widget.kategoriAlamat
          
        });
         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
  print("object");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('pembelian sukses')),)
       ;
        } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan, silakan coba lagi')),
      );
    }
  
              }, 
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed:()async {
            try{
             FirebaseFirestore.instance
                          .collection('belilangsung')
                          .doc()
                          .delete();
      //                     ScaffoldMessenger.of(context).showSnackBar(
      //   // SnackBar(
      //   //   content: Text('Data berhasil dihapus'),
      //   // ),
      // );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => pageMerch( 
                                ))));
            } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );

            }
                      //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
                      //   _formkey.currentState!.validate();
            
          },
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
            GestureDetector(
              onTap: () {
                 Navigator.push(
          context, MaterialPageRoute(builder: (_) => pageNavAlamatRincian(
           Asset: widget.Asset,
            Judul: widget.Judul,
            Menit: widget.Menit,
            id: widget.id,
          )));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 50, left: 20),
                      child: Icon(
                        Icons.location_on_outlined,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  widget.namaPenerima,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 120),
                                child: Text(
                                  widget.notelp,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: Text(
                              widget.alamatlengkap,
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ),
                          
                          Container(
                            child: Text(
                              widget.kategoriAlamat,
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 4,
              margin: EdgeInsets.only(bottom: 10),
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
                            image: NetworkImage(widget.Asset),
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
                                widget.Judul,
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
                                "IDR "+ widget.Menit,
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
                                   onPressed: () {
                // Kurangi jumlah barang jika jumlahnya lebih dari 1
                if (jumlahBarang > 1) {
                  setState(() {
                    jumlahBarang--; // Kurangi jumlah barang
                  });
                }
              },
                                    icon: Icon(
                                      Icons.minimize_rounded,
                                      color: Colors.black,
                                      size: 15,
                                    )),
                              ),
                              Container(
                                child: Text(
                                   "$jumlahBarang",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {
                                  setState(() {
                                    jumlahBarang++; // Tambah jumlah barang
                                  });
                                },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.black,
                                      size: 15,
                                    )),
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
                   
            
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[350]),
            ),
            Container(
              // margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.wallet_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("CARA PEMBAYARAN",
                          style: GoogleFonts.radioCanada(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              color: Colors.black))),
                  Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                          color: Colors.black,
                        )),
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
            Container(
              child: Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 55),
                      child: Text(
                        "Subtotal ($jumlahBarang barang)",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 100, right: 10),
                      child: Text(
                        "IDR $totalHarga" ,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 110),
                    child: Text(
                      "Biaya Pengiriman",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, right: 10),
                      child: Text(
                        "IDR 18000",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[350]),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 75),
                    child: Text(
                      "Total Pembayaran",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 46, right: 10),
                      child: Text(
                        "IDR $totalHarga" ,
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
