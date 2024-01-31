import 'package:flutter/material.dart';
import 'package:flutter_application_2/infoAkun/infosemua.dart';
import 'package:flutter_application_2/pengiriman/alamat.dart';
import 'package:flutter_application_2/pengiriman/navAlamat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home/home.dart';
import '../merch_page/merch_page.dart';

class pageProfile extends StatefulWidget {
  const pageProfile({super.key});

  @override
  State<pageProfile> createState() => _pageProfileState();
}

class _pageProfileState extends State<pageProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pageMerch()));
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Color.fromRGBO(202, 31, 31, 1),
                      size: 35,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pageMerch()));
                    },
                    icon: Icon(
                      Icons.library_books_outlined,
                      color: Color.fromRGBO(202, 31, 31, 1),
                      size: 35,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pageHome()));
                    },
                    icon: Icon(
                      Icons.home_outlined,
                      color: Color.fromRGBO(202, 31, 31, 1),
                      size: 35,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pageMerch()));
                    },
                    icon: Icon(
                      Icons.message_outlined,
                      color: Color.fromRGBO(202, 31, 31, 1),
                      size: 35,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageProfile()));
                    },
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: Color.fromRGBO(202, 31, 31, 1),
                      size: 35,
                    )),
              ),
            ],
          )),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              child: Text(
                "Profile",
                style: GoogleFonts.radioCanada(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 25,
                    color: Color.fromRGBO(202, 31, 31, 1)),
              ),
              margin: EdgeInsets.only(left: 130),
            ),
          ],
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          Container(
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
                    Icons.location_on_outlined,
                    size: 20,
                    color: Color.fromRGBO(202, 31, 31, 1),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("ALAMAT PENGIRIMAN",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 98),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pageNavAlamat()));
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
          Container(
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
                    child: Text("CARA PEMBAYARAN",
                        style: GoogleFonts.roboto(
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
          Container(
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
                    child: Text("INFRORMASI AKUN",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 120),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pageInfo()));
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
        ],
      ),
    );
  }
}
