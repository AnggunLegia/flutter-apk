import 'package:flutter/material.dart';
import 'package:flutter_application_2/pengiriman/alamat.dart';
import 'package:flutter_application_2/pengiriman/alamatTicket.dart';
import 'package:google_fonts/google_fonts.dart';

class selectTambahAlamat extends StatefulWidget {
  const selectTambahAlamat({super.key});

  @override
  State<selectTambahAlamat> createState() => _selectTambahAlamatState();
}

class _selectTambahAlamatState extends State<selectTambahAlamat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(
            "TAMBAH ALAMAT",
            style: GoogleFonts.radioCanada(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 20,
                color: Colors.black),
          ),
          margin: EdgeInsets.only(left: 25),
        ),
          
          
        toolbarHeight: 60,
      ),
      body: Column(
        children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pageAlamat()));
              },
              child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
                       child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.wallet_outlined,
                      size: 20,
                      color: Color.fromRGBO(202, 31, 31, 1),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Tambah Alamat Merch",
                          style: GoogleFonts.radioCanada(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              color: Colors.white))),
                  Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                          color: Color.fromRGBO(202, 31, 31, 1),
                        )),
                  )
                ],
              ),
              ),
            ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => alamatticket()));
            },
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 2),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.info_outline,
                      size: 20,
                      color: Color.fromRGBO(202, 31, 31, 1),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Tambah Alamat Tiket",
                          style: GoogleFonts.radioCanada(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              color: Colors.white))),
                  Padding(
                    padding: EdgeInsets.only(left: 120),
                    child: IconButton(
                        onPressed: () {
                          
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                          color: Color.fromRGBO(202, 31, 31, 1),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}