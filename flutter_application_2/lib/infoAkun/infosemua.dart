
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../pengiriman/navAlamat.dart';

class pageInfo extends StatefulWidget {
  const pageInfo({super.key});

  @override
  State<pageInfo> createState() => _pageInfoState();
}

class _pageInfoState extends State<pageInfo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
       
        title: Row(
          children: [
            Container(
              child: Text(
                "Infromasi Akun",
                style: GoogleFonts.radioCanada(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 25,
                    color: Color.fromRGBO(202, 31, 31, 1)),
              ),
              margin: EdgeInsets.only(left: 60),
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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.location_on_outlined,
                    size: 30,
                    color: Color.fromRGBO(202, 31, 31, 1),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Username",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 43),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pageNavAlamat()));
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
                        color: Color.fromRGBO(202, 31, 31, 1),
                      )),
                )
              ],
            ),
          ),
          Container(
            height: 90,
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
                    size: 30,
                    color: Color.fromRGBO(202, 31, 31, 1),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("CARA PEMBAYARAN",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
                        color: Color.fromRGBO(202, 31, 31, 1),
                      )),
                )
              ],
            ),
          ),
          Container(
            height: 90,
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
                    size: 30,
                    color: Color.fromRGBO(202, 31, 31, 1),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("INFRORMASI AKUN",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 20,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 72),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
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