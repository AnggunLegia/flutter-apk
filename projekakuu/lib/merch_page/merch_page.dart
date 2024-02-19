import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail/detailmerch.dart';
import 'package:flutter_application_2/detail/detailmerch2.dart';
import 'package:flutter_application_2/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

class pageMerch extends StatefulWidget {
  const pageMerch({Key? key}) : super(key: key);

  @override
  State<pageMerch> createState() => _pageMerchState();
}

class _pageMerchState extends State<pageMerch> {
  late CollectionReference merchCollection;

  @override
  void initState() {
    super.initState();
    merchCollection = FirebaseFirestore.instance.collection('coba');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.white,
          onPressed: () {
             Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pageHome()
                          )
             );
          },),
          title: Row(
            children: [
              Container(
                child: Text(
                  "Merchandise",
                  style: GoogleFonts.radioCanada(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 25,
                      color: Color.fromRGBO(202, 31, 31, 1)),
                ),
                margin: EdgeInsets.only(left: 30),
              ),
            ],
          ),
          toolbarHeight: 60,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: GestureDetector(

              child: Column(
                      children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: FutureBuilder<QuerySnapshot>(
                    future: merchCollection.get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('error: ${snapshot.error}');
                      } else {
                        var merchDocs = snapshot.data!.docs;
            
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 0.7),
                            itemCount: merchDocs.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext ctx, index) {
                              var data =
                                  merchDocs[index].data() as Map<String, dynamic>;
                              return GestureDetector(
                               
                     
                     
                                child: Container(
                                  width: 70,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 2, color: Colors.black),
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
                                        width: 140,
                                        height: 140,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image:
                                                    NetworkImage(data['Asset']))),
                                        margin:
                                            EdgeInsets.only(top: 20, bottom: 10),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 30),
                                        child: Text(data['Judul'],
                                            style: GoogleFonts.radioCanada(
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge,
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 70),
                                        child: Text("IDR ${data['Menit']}",
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
                              builder: (context) => detailmerch(
                               id: data["id"],
                               Asset: data["Asset"]?.toString() ??'' ,
                               Judul: data["Judul"]?.toString() ??'',
                               Menit: data["Menit"]?.toString() ??'',
                               Deskripsi:data["Deskripsi"]?.toString() ??'',
                               Stok: data["Stok"]?.toString() ??'', 
                                 
                              )));
                                }
                              );
                            
                            });
                      }
                    }),
              )
                      ],
                    ),
                     
                    
            )
            )
    );
           
  }
}
