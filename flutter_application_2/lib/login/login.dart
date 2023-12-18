import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/home/home.dart';
import 'package:flutter_application_2/login/resgitrasi.dart';

class pageLogin extends StatefulWidget {
  const pageLogin({super.key});

  @override
  State<pageLogin> createState() => _pageLoginState();
}

class _pageLoginState extends State<pageLogin> {
  final _formkey = GlobalKey<FormState>(); 
  bool _isObscure = true;
  final TextEditingController _email = TextEditingController();
      final TextEditingController _password = TextEditingController();

      signInWithEmailAndPassword() async  {
        try {
         
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _email.text,
    password: _password.text,
  );
  

  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
  print("object");
}catch (e) {
   
print(e.toString());
 return ScaffoldMessenger.of(context).showSnackBar(
   const SnackBar(
    content: Text("email atau password salah")
    ),
    );

}
  
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.black,
    body: Form(
     
     key: _formkey, 
     child: SingleChildScrollView(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.only(top: 30, left: 250,   ),
              child: Container(
                    height: 50,
                    width: 100,
                    child: Image.asset("assets/images/logorc1.png"),
                  ),
             ),
             Padding(
        padding: const EdgeInsets.only(top: 10, left: 50, right: 50,  ),
        child: IconButton(
        onPressed: (){},
        icon: Icon(Icons.group_rounded, size: 150, color: Colors.white),
        
        ),
         ),
       
          
           Padding(
             padding: const EdgeInsets.only(bottom: 30, ),
             child: Text("LOGIN", style: TextStyle(
              color: Colors.white, fontSize: 30, 
                   ), ),
           ),
         
        
       
       
         
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
        
             
            
           child: TextFormField(
              controller: _email,
              validator: ( value) {
              if(value == null || value.isEmpty){
                return 'Email kosong';
               }
                return null;
               },
               decoration: InputDecoration(
              hintText: "Contoh: budi234@gmail.com",
              labelText: "Email",
              labelStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 110, 115, 121), fontWeight: FontWeight.bold),                 
               //  icon: Icon(Icons.apartment_rounded),
              border: OutlineInputBorder(
               borderRadius: new BorderRadius.circular(10.0), 
              borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 38, 66, 189))
               ),
                
                filled: true,
               fillColor: Colors.white,
                ),
                       ),
          ),
     
          
            
         
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        
             
            
           child: TextFormField(
             controller: _password,
              obscureText: _isObscure,
                                validator: ( value) {
                                  if(value == null || value.isEmpty){
                                  return 'Password kosong';
                                }
                                  return null;
              
                                },
                                decoration: InputDecoration(
                              
                               labelText: "Password",
                               labelStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 110, 115, 121), fontWeight: FontWeight.bold),
                                  //  icon: Icon(Icons.apartment_rounded),
                                   border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0), 
                                  borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 38, 66, 189))
                                ),
                                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                                filled: true,
                                fillColor: Colors.white,
                                ),
                       ),
          ),
          Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                       GestureDetector(
                        child: Container(
                         child:Text("Lupa password?", style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white
                        ),),
                        margin: EdgeInsets.only(right: 20, bottom:5),
                        ),
                        ),
                        
                      ],
                    ),
          Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                    height: 50,
                    width: 365,
                    decoration: BoxDecoration(
                    color: Color.fromARGB(255, 78, 78, 76),
                      borderRadius: BorderRadius.circular(10)
                    ),
                     child: TextButton(
                      
                      onPressed: () {
                        if
                              (_formkey.currentState!.validate()){
                                 signInWithEmailAndPassword();
                               
                              }
                          //   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>pageHome()));
                          //   _formkey.currentState!.validate();
                              }, 
                         
                          child:
                            Text("LOGIN",
                          style: TextStyle(fontSize: 20,
                          color: Colors.black),),  ),
                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                        child: Text("Tidak punya akun?", style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white
                        ),),
                         margin: EdgeInsets.only( top:5, bottom:5),
                        ),
                        GestureDetector(
                          child: Container(
                            child: Text("Buat akun", style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold, 
                            color: Colors.white
                          ),),
                           margin: EdgeInsets.only(right: 20, top:5, bottom:5),
                          ),
                           onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => pageRegis())
                         );
                         } ,
                        ),
                      ],
                    )
          ],
         
        ),
     )
    
    
    
     
    



    ),
    );
  }
}