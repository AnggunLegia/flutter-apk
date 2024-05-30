import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail/detailmerch.dart';
import 'package:flutter_application_2/detail/detailticket.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home.dart';

class rinciantiket extends StatefulWidget {
  const rinciantiket(
      {super.key,
      required this.id,
      required this.Tempat,
      required this.Asset,
      required this.Harga,
      required this.Tanggal, required this.Deskripsi, required this.Stok, required this.Jumlah});
  final String id;
  final String Tempat, Asset, Harga, Tanggal, Deskripsi, Stok, Jumlah;

  @override
  State<rinciantiket> createState() => _rinciantiketState();
}

class _rinciantiketState extends State<rinciantiket> {
  int jumlahBarang = 1; // Variabel untuk menyimpan jumlah barang yang dipilih
  int hargaPerBarang = 0; // Harga per barang

   void initState() {
    super.initState();
    // Inisialisasi harga per barang saat widget pertama kali dibuat
    hargaPerBarang = int.parse(widget.Harga);
  }

  

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _namapenerima = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _notelp = TextEditingController();
    String _getCurrentTime() {
    var time = DateTime.now();

    return "${time.day.toString().padLeft(2, '0')}-${time.month.toString().padLeft(2, '0')}-${time.year.toString().padLeft(2, '0')},${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }
  final _userStream =
      FirebaseFirestore.instance.collection("belilangsungtiket").snapshots();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // void dispose() {
  //   deleteDocument(widget.id);
  //   super.dispose();
  // }

Future<void> deleteDocumentAndNavigateBack() async {
  try {
    // Delete the document from Firestore
    await FirebaseFirestore.instance.collection("belilangsungtiket").doc(widget.id).delete();
    print("Document successfully deleted!");

    // Navigate back to the previous screen
    Navigator.pop(context);
  } catch (e) {
    print("Error deleting document: $e");
  }
}
       // Function to delete document
  // Future<void> deleteDocument(String documentId) async {
  //   try {
  //     await FirebaseFirestore.instance.collection("belilangsungtiket").doc(documentId).delete();
  //     print("Document successfully deleted!");
  //      Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => detailticket(
  //                             Deskripsi: widget.Deskripsi,
  //                             Stok: widget.Stok,
  //                             id: widget.id,
  //                             Asset: widget.Asset,
  //                             Tempat: widget.Tempat,
  //                             Tanggal: widget.Tanggal,
  //                             Harga: widget.Harga,
  //                             Jumlah: widget.Jumlah,
  //                             //  jumlah: 1
  //                           )));
  //   } catch (e) {
  //     print("Error deleting document: $e");
  //   }
  // }
  Future<void> addItem() async {
     await _firestore.collection('pembelian').add({
          'judul' : widget.Tempat,
          'assets' : widget.Asset,
          'harga': widget.Harga,
          'jumlah': jumlahBarang ,
          'waktu_pembelian': _getCurrentTime(),
          'id_pembelian': widget.id,
          'kategori' : "Tiket",
          'nama_penerima': _namapenerima.text,
          'alamat_penerima': _email.text,
        
        });
  //        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
  print("object");
  ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('pembelian sukses')),)
       ;
       
  }
  

  @override
  Widget build(BuildContext context) {
    // Hitung total harga berdasarkan jumlah barang yang dipilih
    int totalHarga = hargaPerBarang * jumlahBarang;


   return WillPopScope(
    onWillPop: () async {
      // Call the deleteDocumentAndNavigateBack function when the back button is pressed
      await deleteDocumentAndNavigateBack();
      return false;
    },
    child: Scaffold(
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
                   "IDR $totalHarga", // Tampilkan total harga yang dihitung,
                  style: GoogleFonts.radioCanada(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 17,
                      color: Colors.white),
                ),
              ),
            ),
           GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cek Lagi Pesanannya'),
          content: Text("Sudah benar pesanannya?"),
          actions: [
            TextButton(
              onPressed: () async {
                // addItem();
           await _firestore.collection('pembelian').add({
          'judul' : widget.Tempat,
          'assets' : widget.Asset,
          'harga': totalHarga,
          'jumlah': jumlahBarang ,
          'waktu_pembelian': _getCurrentTime(),
          'id_pembelian': widget.id,
          'kategori' : "Tiket",
          'nama_penerima1': _namapenerima.text,
          'alamat_penerima1': _email.text,
          'no_telp1': _notelp.text,
          'kategori_alamat1': "Alamat E-mail"
        });
  //        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
  print("object");
  ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('pembelian sukses')),)
       ;
       
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Menutup dialog
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  },
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
)

          ],
        ),
      ),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
           deleteDocumentAndNavigateBack();
          },
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
                    margin: EdgeInsets.only(top: 15, bottom: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                widget.Tempat
                                ,
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
                              padding: EdgeInsets.only(
                                  left: 5, bottom: 10, right: 75),
                              child: Text(
                                widget.Tanggal,
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
                              padding: EdgeInsets.only(bottom: 50, right: 75),
                              child: Text(
                                "IDR " + widget.Harga,
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
      margin: EdgeInsets.only(left: 60),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
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
              ),
            ),
          ),
          Container(
            child: Text(
              "$jumlahBarang", // Gunakan nilai variabel jumlah barang
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                jumlahBarang++; // Tambah jumlah barang
              });
            },
            icon: Icon(
              Icons.add,
              color: Colors.black,
              size: 15,
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
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[350]),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    "Detail Pemesanan",
                    style: GoogleFonts.radioCanada(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            Form(
              key: _formkey,
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
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'No Telepon kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Contoh: budi.123@gmail.com",
                      labelText: "E-mail",
                      
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
                
                // Container(
                //   margin:
                //       EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                //   height: 50,
                //   width: 365,
                //   decoration: BoxDecoration(
                //       color: Colors.black,
                //       borderRadius: BorderRadius.circular(10)),
                //   child: TextButton(
                //     onPressed: () {
                //       if (_formkey.currentState!.validate()) {
                //         ScaffoldMessenger.of(context).showSnackBar(
                //           const SnackBar(
                //               content: Text("Data berhasil ditambahkan")),
                //         );
                //         formalamat();
                //       }
                //       //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
                //       //   _formkey.currentState!.validate();
                //     },
                //     child: Text(
                //       "TAMBAH ALAMAT TIKET",
                //       style: TextStyle(fontSize: 20, color: Colors.white),
                //     ),
                //   ),
                // ),
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
                    padding: EdgeInsets.only(left: 130),
                    child: Text("Gopay",
                    style: GoogleFonts.radioCanada(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              color: Colors.black))
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
                      padding: const EdgeInsets.only(left: 10, right: 50),
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
                         "IDR $totalHarga", // Tampilkan total harga yang dihitung,,
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
              height: 3,
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
                         "IDR $totalHarga", // Tampilkan total harga yang dihitung,
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
    )
   );
  }
}
