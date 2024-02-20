import 'package:flutter/material.dart';
import 'package:flutter_application_2/ticket_page/ticket.dart';
import 'package:google_fonts/google_fonts.dart';

class detailticket extends StatefulWidget {
  const detailticket({super.key, 
  required this.id, 
  required this.Tempat, 
  required this.Asset, 
  required this.Stok, 
  required this.Deskripsi, 
  required this.Harga, 
  required this.Tanggal});
 final String id;
 final String Tempat, Asset, Stok, Deskripsi, Harga, Tanggal;
  @override
  State<detailticket> createState() => _detailticketState();
}

class _detailticketState extends State<detailticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
      color: Colors.black,
      child: Row(
        children: [
          IconButton(onPressed: () {
            
          }, 
          icon: Icon(Icons.chat_rounded,
          size: 35 ,
          color: Color.fromRGBO(202, 31, 31, 1),
          )),
           GestureDetector(
            child: Container(
              height: 35,
              width: 140,
            margin: EdgeInsets.only(right: 10, left: 10),
              child: Padding(
                padding:EdgeInsets.only(top: 10, left: 14),
                child: Text("BELI SEKARANG", style: 
                GoogleFonts.candal(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 15,
                        color: Colors.white),
                      ),
              ),
                    decoration: BoxDecoration(
                      color: Colors.amber[600],
                      borderRadius: BorderRadius.circular(15),
                    ),
            ),
          ),
          GestureDetector(
            child: Container(
               height: 35,
              width: 160,
            
              child: Padding(
                padding:EdgeInsets.only(top: 10, left: 14),
                child: Text("TAMBAH KE TROLI", style: 
                GoogleFonts.candal(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        fontSize: 15,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              
              width: 412,
              height: 330,
              decoration: BoxDecoration( image: DecorationImage(
                                                image:
                                                    NetworkImage(widget.Asset),
                                                    fit: BoxFit.cover)
                                           ),
                                           child: Column(
                                             children: [
                                               Row(
                                                 children: [
                                                   Container(
                                                    
                                                     child: IconButton (onPressed: () {

                                                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageTicket()));
                                                     },
                                                     icon:Icon(Icons.arrow_back_rounded, 
                                                     size: 40,
                                                     color:  Color.fromRGBO(202, 31, 31, 1),)),
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
                  child: Text(widget.Tempat, 
                  style: GoogleFonts.candal(
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
                  margin: EdgeInsets.only(left: 6, bottom: 5),
                  child: Text(widget.Tanggal, 
                  style: GoogleFonts.candal(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 18,
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
                  child: Text("IDR."+widget.Harga,
                  style: GoogleFonts.candal(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 17,
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
                  child: Text("Stok "+widget.Stok, 
                  style: GoogleFonts.candal(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 16,
                    color: const Color.fromARGB(255, 133, 129, 129)),
                  ),
                  
            ),
               ],
             ),
             Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              decoration: BoxDecoration(color: Colors.black),
              
            ),
             Container(
               child:Column(
                 children: [
                   Row(
                     children: [
                       Container(
                        margin: EdgeInsets.only(left: 6, top: 5, bottom: 5),
                         child: Text("Pengiriman", 
                                     style: GoogleFonts.candal(
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
                    margin: EdgeInsets.only(right: 320, bottom:5 , left: 5),
                    child: Icon(Icons.location_on_outlined)),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text("Alamat", style:
                    GoogleFonts.candal(
                      textStyle: Theme.of(context).textTheme.displayLarge,
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
                        margin: EdgeInsets.only(right: 280, bottom: 6, left: 5),
                        child: Text("Standar",
                        style: GoogleFonts.candal(
                                          textStyle: Theme.of(context).textTheme.displayLarge,
                                          fontSize: 15,
                                          color: Colors.black),),
                      ),
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      child: Text("Rp 18.000",
                        style: GoogleFonts.candal(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 15,
                      color: Colors.black),),
                    ),
                    ],
                  ),
                 )],
               ),
              
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              decoration: BoxDecoration(color: Colors.black),
              
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, top: 10),
                  child: Text("Deskripsi", 
                  style: GoogleFonts.candal(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                  ),
                  
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5, top: 10),
                  child: Text(widget.Deskripsi, 
                  style: GoogleFonts.candal(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    fontSize: 20,
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