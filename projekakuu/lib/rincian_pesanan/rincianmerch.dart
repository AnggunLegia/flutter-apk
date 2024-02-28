import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail/detailmerch.dart';
import 'package:google_fonts/google_fonts.dart';

class rincianmerch extends StatefulWidget {
  const rincianmerch({
    super.key,
    required this.Asset,
    required this.Judul,
    required this.id,
    required this.Menit,
  });
  final String id;
  final String Asset, Judul, Menit;

  @override
  State<rincianmerch> createState() => _rincianmerchState();
}

class _rincianmerchState extends State<rincianmerch> {
  @override
  Widget build(BuildContext context) {
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
                  widget.Menit,
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
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: BackButton(
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
                                "nama",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 120),
                              child: Text(
                                "083820087532",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: Text(
                            "kp. Bantar Gedang Rt 004/ Rw 009, Des. Mekarsari",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Kec. Ngamprah, Kab. Bandung Barat, Jawa Barat",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Rumah",
                            style: TextStyle(fontSize: 10, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
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
                                "IDR " + widget.Menit,
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
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.minimize_rounded,
                                      color: Colors.black,
                                      size: 15,
                                    )),
                              ),
                              Container(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {},
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
                        "Subtotal (1 barang)",
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
                        "IDR " + widget.Menit,
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
                        "IDR " + widget.Menit,
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
