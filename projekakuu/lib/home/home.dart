import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/merch_page/merch_page.dart';
import 'package:flutter_application_2/profile/profile.dart';
import 'package:flutter_application_2/riwayat/riwayat.dart';
import 'package:flutter_application_2/troli/trolimerch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:line_icons/line_icons.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../ticket_page/ticket.dart';

class pageHome extends StatefulWidget {
  const pageHome({super.key});

  @override
  State<pageHome> createState() => _pageHomeState();
}

class _pageHomeState extends State<pageHome> {
  final _userStream =
      FirebaseFirestore.instance.collection("upcoming").snapshots();

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
                          MaterialPageRoute(builder: (context) => trolimerch()));
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
                          MaterialPageRoute(builder: (context) => riwayatpembelian()));
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
                "Reality Club",
                style: GoogleFonts.radioCanada(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 25,
                    color: Color.fromRGBO(202, 31, 31, 1)),
              ),
              margin: EdgeInsets.only(left: 90),
            ),
          ],
        ),
        toolbarHeight: 60,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: [
                    Container(
                      // child: Image.asset('assets/images/rc3app.jpg'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage('assets/images/rc3app.jpg')),
                      ),
                    ),
                    Container(
                      //  child: Image.asset('assets/images/rc10app.jpeg', ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage('assets/images/rc10app.jpeg')),
                      ),
                    ),
                    Container(
                      // child: Image.asset('assets/images/rccapp.jpg'),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage('assets/images/rccapp.jpg')),
                      ),
                    ),
                  ]),
              margin: EdgeInsets.only(top: 10),
            ),
            Row(
              children: [
                GestureDetector(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 5),
                            child: Image.asset('assets/images/shirt3.png',
                                height: 40, width: 40),
                          ),
                          Text(
                            "Merch",
                            style: GoogleFonts.candal(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              color: Color.fromRGBO(202, 31, 31, 1),
                            ),
                          )
                        ],
                      ),
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(left: 60, top: 30),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 4))
                          ],
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pageMerch()));
                    }),
                GestureDetector(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7, bottom: 5),
                            child: Image.asset('assets/images/ticket3.png',
                                height: 40, width: 40),
                          ),
                          Text(
                            "Ticket",
                            style: GoogleFonts.candal(
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 15,
                              color: Color.fromRGBO(202, 31, 31, 1),
                            ),
                          )
                        ],
                      ),
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(left: 80, top: 30),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 3,
                                blurRadius: 2,
                                offset: Offset(0, 4))
                          ],
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageTicket()));
                    }),
              ],
            ),
            Container(
              child: Text(
                'Upcoming!',
                style: GoogleFonts.viga(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
                    color: Colors.black),
              ),
              margin: EdgeInsets.only(top: 30, right: 180, bottom: 10),
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
                            child: Column(children: [
                              Container(
                                width: 300,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(doc[index]['Asset']))),
                                margin: EdgeInsets.only(bottom: 5),
                              ),
                            ]),
                          );
                        });
                  }
                  return CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
