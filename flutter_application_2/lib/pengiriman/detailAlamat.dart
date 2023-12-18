import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/profile/profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import 'navAlamat.dart';

class pageDetailAlamat extends StatefulWidget {
  const pageDetailAlamat({super.key, 
   required this.namaPenerima,
   required this.notelp,
   required this.provinsi,
   required this.id,
   required this.kota,
   required this.kecamatan,
   required this.desa,
   required this.alamatlengkap,
   required this.kategoriAlamat
  });
  final String id;
  final String namaPenerima, notelp, provinsi, kota, kecamatan, desa, alamatlengkap, kategoriAlamat;

  @override
  State<pageDetailAlamat> createState() => _pageDetailAlamatState();
}

class _pageDetailAlamatState extends State<pageDetailAlamat> {
  final _formkey = GlobalKey<FormState>();
    TextEditingController _namapenerima = TextEditingController();
    TextEditingController _notelp = TextEditingController();
    TextEditingController _provinsi = TextEditingController();
    TextEditingController _kota = TextEditingController();
    TextEditingController _kecamatan = TextEditingController();
    TextEditingController _desa = TextEditingController();
    TextEditingController _alamatlengkap = TextEditingController();
    TextEditingController _kategorialmat = TextEditingController();

    formalamat()async{
    try{
      var uuid=Uuid();
      String id = uuid.v4();
       await FirebaseFirestore.instance.collection("alamat").doc(widget.id).update({
        "uid": id,
    "nama penerima": _namapenerima.text, 
    "notelp": _notelp.text, 
    "provinsi":_provinsi.text,
    "kota": _kota.text,
    "kecamatan": _kecamatan.text,
    "desa": _desa.text,
    "alamat lengkap": _alamatlengkap.text,
    "kategori alamat": _kategorialmat.text,
    
  });
   Navigator.push(context, MaterialPageRoute(builder: (_)=>pageProfile()));
    }catch (e) {
   

 ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
    content: Text(e.toString())
    ),
    );

  
  
}
  }
  @override
   void initState() {
    // TODO: implement initState 
    _namapenerima= TextEditingController(text: widget.namaPenerima);
    _notelp= TextEditingController(text: widget.notelp);
    _provinsi= TextEditingController(text: widget.provinsi);
    _kota= TextEditingController(text: widget.kota);
    _kecamatan= TextEditingController(text: widget.kecamatan);
    _desa= TextEditingController(text: widget.desa);
    _alamatlengkap= TextEditingController(text: widget.alamatlengkap);
    _kategorialmat= TextEditingController(text: widget.kategoriAlamat);
   
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:   Container(
             
             child: Text("TAMBAH ALAMAT", style: GoogleFonts.candal(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                            fontSize: 30, 
                            color: Colors.black
                ), ),
           ),
           toolbarHeight: 60,
      ),
        body: Form(
     
     key: _formkey, 
     child: SingleChildScrollView(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            
       
          
         
         
        
       
         Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 30),
        
             
            
           child: TextFormField(
              controller: _namapenerima,
              maxLength: 20,
              validator: ( value) {
              if(value == null || value.isEmpty){
                return 'Nama Penerima kosong';
               }
                return null;
               },
               decoration: InputDecoration(
              hintText: "Contoh: budiansyah",
              labelText: "Nama Penerima",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),                 
               //  icon: Icon(Icons.apartment_rounded),
              border: OutlineInputBorder(
               borderRadius: new BorderRadius.circular(10.0), 
              borderSide: BorderSide(width: 2, color: Colors.black)
               ),
                
                filled: true,
               fillColor: Colors.white,
                ),
                       ),
          ),

           Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        
             
            
           child: TextFormField(
              controller: _notelp,
              validator: ( value) {
              if(value == null || value.isEmpty){
                return 'No Telepon kosong';
               }
                return null;
               },
               decoration: InputDecoration(
              hintText: "Contoh: 083xxx",
              labelText: "No Telepon",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),                 
               //  icon: Icon(Icons.apartment_rounded),
              border: OutlineInputBorder(
               borderRadius: new BorderRadius.circular(10.0), 
              borderSide: BorderSide(width: 2, color: Colors.black)
               ),
                
                filled: true,
               fillColor: Colors.white,
                ),
                       ),
          ),
         
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        
             
            
           child: TextFormField(
              controller: _provinsi,
              validator: ( value) {
              if(value == null || value.isEmpty){
                return 'Provinsi kosong';
               }
                return null;
               },
               decoration: InputDecoration(
              hintText: "Contoh: Jawa Barat",
              labelText: "Provinsi",
              labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),                 
               //  icon: Icon(Icons.apartment_rounded),
              border: OutlineInputBorder(
               borderRadius: new BorderRadius.circular(10.0), 
              borderSide: BorderSide(width: 2, color: Colors.black)
               ),
                
                filled: true,
               fillColor: Colors.white,
                ),
                       ),
          ),
     
          
            
         
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        
             
            
           child: TextFormField(
             controller: _kota,
             
                                validator: ( value) {
                                  if(value == null || value.isEmpty){
                                  return 'kota/kabupaten kosong';
                                }
                                  return null;
              
                                },
                                decoration: InputDecoration(
                                hintText: "Contoh: Kab. Bandung Barat/Kota Cimahi",
                                labelText: "Kota/Kabupaten",
                                labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                  //  icon: Icon(Icons.apartment_rounded),
                                   border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0), 
                                  borderSide: BorderSide(width: 2, color: Colors.black)
                                ),
                                  
                                filled: true,
                                fillColor: Colors.white,
                                ),
                       ),
          ),

           Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
           child: TextFormField(
             controller: _kecamatan,
             
                                validator: ( value) {
                                  if(value == null || value.isEmpty){
                                  return 'Kecamatan/Kelurahan kosong';
                                }
                                  return null;
              
                                },
                                decoration: InputDecoration(
                                hintText: "Contoh: Ngamprah",
                                labelText: "Kelurahan/Kecamatan",
                                labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                  //  icon: Icon(Icons.apartment_rounded),
                                   border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0), 
                                  borderSide: BorderSide(width: 2, color: Colors.black)
                                ),
                                  
                                filled: true,
                                fillColor: Colors.white,
                                ),
                       ),
          ),

          Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
           child: TextFormField(
             controller: _desa,
             
                                validator: ( value) {
                                  if(value == null || value.isEmpty){
                                  return 'desa kosong';
                                }
                                  return null;
              
                                },
                                decoration: InputDecoration(
                                hintText: "Contoh: Margajaya",
                                labelText: "Desa",
                                labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                  //  icon: Icon(Icons.apartment_rounded),
                                   border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0), 
                                  borderSide: BorderSide(width: 2, color: Colors.black)
                                ),
                                  
                                filled: true,
                                fillColor: Colors.white,
                                ),
                       ),
          ),

          Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
           child: TextFormField(
             controller: _alamatlengkap,
             maxLength: 200,
                                validator: ( value) {
                                  if(value == null || value.isEmpty){
                                  return 'Alamat Lengkap kosong';
                                }
                                  return null;
              
                                },
                                decoration: InputDecoration(
                                hintText: "Contoh: rumah no. xx, rt/rw 02/03",
                                labelText: "almat Lengkap",
                                labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                  //  icon: Icon(Icons.apartment_rounded),
                                   border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0), 
                                  borderSide: BorderSide(width: 2, color: Colors.black)
                                ),
                                  
                                filled: true,
                                fillColor: Colors.white,
                                ),
                       ),
          ),

           Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        
             
            
           child: TextFormField(
             controller: _kategorialmat,
             
                                validator: ( value) {
                                  if(value == null || value.isEmpty){
                                  return 'Kategori kosong';
                                }
                                  return null;
              
                                },
                                decoration: InputDecoration(
                                hintText: "Contoh: Rumah/Kantor",
                                labelText: "Kategori Alamat",
                                labelStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                  //  icon: Icon(Icons.apartment_rounded),
                                   border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0), 
                                  borderSide: BorderSide(width: 2, color: Colors.black)
                                ),
                                  
                                filled: true,
                                fillColor: Colors.white,
                                ),
                       ),
          ),

           Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    height: 50,
                    width: 365,
                    decoration: BoxDecoration(
                    color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                     child: TextButton(
                      
                      onPressed: () {
                        FirebaseFirestore.instance.collection('alamat').doc(widget.id).delete();
                    Navigator.push(context, MaterialPageRoute(
                            builder: ((context) =>pageNavAlamat())
                    ));
                          //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
                          //   _formkey.currentState!.validate();
                              }, 
                         
                          child:
                            Text("HAPUS ALAMAT",
                          style: TextStyle(fontSize: 20,
                          color: Colors.white),),  ),
                   ),
          
          Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    height: 50,
                    width: 365,
                    decoration: BoxDecoration(
                    color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                    ),
                     child: TextButton(
                      
                      onPressed: () {
                        if
                              (_formkey.currentState!.validate()){
                                 ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Data berhasil ditambahkan")),);
                                 formalamat();
                               
                              }
                          //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
                          //   _formkey.currentState!.validate();
                              }, 
                         
                          child:
                            Text("TAMBAH ALAMAT",
                          style: TextStyle(fontSize: 20,
                          color: Colors.white),),  ),
                   ),
                   
          ],
         
        ),
     )
    
    
    
     
    



    ),
    );
  }
}