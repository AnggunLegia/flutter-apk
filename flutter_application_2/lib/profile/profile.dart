import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: IconButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => pageMerch())
                           );
              }, icon: Icon(Icons.shopping_cart_outlined, color: Color.fromRGBO(202, 31, 31, 1), size: 35, )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => pageMerch())
                           );
              }, icon: Icon(Icons.library_books_outlined, color: Color.fromRGBO(202, 31, 31, 1), size: 35, )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => pageHome())
                           );
              }, icon: Icon(Icons.home_outlined, color: Color.fromRGBO(202, 31, 31, 1), size: 35, )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => pageMerch())
                           );
              }, icon: Icon(Icons.message_outlined, color: Color.fromRGBO(202, 31, 31, 1), size: 35, )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25, ),
              child: IconButton(onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => pageProfile())
                           );
              }, icon: Icon(Icons.person_2_outlined, color: Color.fromRGBO(202, 31, 31, 1), size: 35, )),
            ),
          ],
        ) ),
       appBar: AppBar(
        
        automaticallyImplyLeading: false,
        title: 
        Row(
          children: [
            Container(
               child: Text("Profileaa", style: GoogleFonts.radioCanada(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 25, 
                            color: Color.fromRGBO(202, 31, 31, 1)
                ),
                
                ),
                margin: EdgeInsets.only(left: 90),
                ),
                
          ],
        ),
          toolbarHeight: 60,
            backgroundColor:Colors.black,
                  ),
      body: Container(
        color: Colors.blue,
      ) ,
                
    );
  }
}