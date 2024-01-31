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
    return Scaffold(
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
              margin: EdgeInsets.only(left: 20),
            ),
          ],
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2, top: 2),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("E-mail",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                    padding: EdgeInsets.only(left: 205),
                    child: Text("E-mail",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 5),
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
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Username",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                    padding: EdgeInsets.only(left: 150),
                    child: Text("Username",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 5),
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
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("No. Handphone",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                    padding: EdgeInsets.only(left: 75),
                    child: Text("No. Handphone",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 5),
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
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Ganti Password",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 185),
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
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Logout",
                        style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 15,
                            color: Colors.white))),
                Padding(
                  padding: EdgeInsets.only(left: 245),
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
        ],
      ),
    );
  }
}
