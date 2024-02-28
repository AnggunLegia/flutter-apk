import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail/detailticket.dart';
import 'package:flutter_application_2/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class pageTicket extends StatefulWidget {
  const pageTicket({Key? key}) : super(key: key);

  @override
  State<pageTicket> createState() => _pageTicketState();
}

class _pageTicketState extends State<pageTicket> {
  late CollectionReference ticketCollection;

  @override
  void initState() {
    super.initState();
    ticketCollection = FirebaseFirestore.instance.collection('konser');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pageHome()));
            },
          ),
          title: Row(
            children: [
              Container(
                child: Text(
                  "Ticket",
                  style: GoogleFonts.radioCanada(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 25,
                      color: Color.fromRGBO(202, 31, 31, 1)),
                ),
                margin: EdgeInsets.only(left: 70),
              ),
            ],
          ),
          toolbarHeight: 60,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: FutureBuilder<QuerySnapshot>(
                    future: ticketCollection.get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('error: ${snapshot.error}');
                      } else {
                        var ticketDocs = snapshot.data!.docs;

                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 0.7),
                            itemCount: ticketDocs.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, index) {
                              var data = ticketDocs[index].data()
                                  as Map<String, dynamic>;
                              return GestureDetector(
                                  child: Container(
                                    width: 70,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 3,
                                            blurRadius: 2,
                                            offset: Offset(0, 4))
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 130,
                                          height: 130,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      data['Asset']))),
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 42),
                                          child: Text(data['Tempat'],
                                              style: GoogleFonts.radioCanada(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 70),
                                          child: Text("IDR ${data['Harga']}",
                                              style: GoogleFonts.radioCanada(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .displayLarge,
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => detailticket(
                                                  id: data["id"],
                                                  Asset: data["Asset"]
                                                          ?.toString() ??
                                                      '',
                                                  Tempat: data["Tempat"]
                                                          ?.toString() ??
                                                      '',
                                                  Harga: data["Harga"]
                                                          ?.toString() ??
                                                      '',
                                                  Deskripsi: data["Deskripsi"]
                                                          ?.toString() ??
                                                      '',
                                                  Stok: data["Stok"]
                                                          ?.toString() ??
                                                      '',
                                                  Tanggal: data["Tanggal"]
                                                          ?.toString() ??
                                                      '',
                                                )));
                                  });
                            });
                      }
                    }))
          ],
        )));
  }
}
