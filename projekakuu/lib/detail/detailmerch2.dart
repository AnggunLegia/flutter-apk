// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class detailmerch2 extends StatefulWidget {
//   const detailmerch2({super.key, required this.id});


// final String id;

//   @override

//   State<detailmerch2> createState() => _detailmerch2State();
// }

// class _detailmerch2State extends State<detailmerch2> {
//    late Future<DocumentSnapshot> document;
   
//   @override
//   void initState() {
//     super.initState();
//     document = FirebaseFirestore.instance.collection('coba').doc(widget.id).get();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<DocumentSnapshot>(
//         future: document,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             var data = snapshot.data!.data() as Map<String, dynamic>;
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('${data['Judul']}'),
                  
//                   // Add more fields as needed
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
    
//   }
