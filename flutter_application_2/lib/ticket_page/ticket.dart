import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class pageTicket extends StatefulWidget {
  const pageTicket({super.key});

  @override
  State<pageTicket> createState() => _pageTicketState();
}

class _pageTicketState extends State<pageTicket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        
        leading:BackButton(color: Colors.white),
        title: 
        Row(
          children: [
            Container(
               child: Text("Ticket", style: GoogleFonts.radioCanada(
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
     body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.7), itemCount: 10,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  child: Container(
                    width: 70,
                    height: 90,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      color: Colors.grey[400],
                       borderRadius: BorderRadius.circular(10.0),
                         boxShadow: [BoxShadow(
                         color: Colors.black26,
                         spreadRadius: 3,
                         blurRadius: 2,
                         offset: Offset(0, 4)
                        )],

                    ),
                    child: Column(
                      children: [
                        Container(
                         
                         child: Image.asset("assets/images/ticket.jpg", width: 140, height: 140, ),
                         margin: EdgeInsets.only(top:20, bottom: 10),
                        ),
                        Text("Festival Musik", style:  GoogleFonts.radioCanada(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 23, 
                            color: Colors.black,
                            fontWeight: FontWeight.bold) ),

                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("IDR 200.000", style:  GoogleFonts.radioCanada(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              fontSize: 20, 
                              color: Colors.black,
                              fontWeight: FontWeight.bold) ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              ),
              )
            ],
          )
     )
    );
              }
              
            
        
    
  }
