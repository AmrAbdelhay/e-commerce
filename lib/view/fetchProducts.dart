




// Widget fetchData (String favoriteitems){
//   return StreamBuilder<QuerySnapshot>(
//       stream: fireStore.collection('Product').snapshots(),
//       builder: (context, snapShot) {
//         return snapShot.hasData
//             ? ListView.builder(
//             itemCount: snapShot.data?.docs.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//
//                 },
//
//
//
//                 child: Card(
//                   color: Colors.transparent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 10,
//                   clipBehavior: Clip.antiAlias,
//                   shadowColor: Color(0xffDAD3C8),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(height: 12),
//                         Row(
//                           children: [
//                             Container(
//                               height: 100,
//                               width: 100,
//                               child:  CachedNetworkImage(imageUrl:  snapShot.data?.docs[index]
//                               ['image'] ,
//
//                               ),
//                               decoration: BoxDecoration(
//                                 borderRadius:
//                                 BorderRadius.circular(20),
//                                 color: Colors.grey,
//
//                               ),
//                             ),
//                             SizedBox(
//                               width: 15,
//                             ),
//                             Column(
//                               mainAxisAlignment:
//                               MainAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Container(
//                                   width: 100,
//                                   child: Text(
//                                     snapShot.data?.docs[index]
//                                     ['name'],
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                   width: 100,
//                                   child: Text(
//                                     "${snapShot.data?.docs[index]['price']} EGP",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                   width: 100,
//                                   child: Text(
//                                     snapShot.data?.docs[index]
//                                     ['size'],
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 5,
//                             ),
//
//
//
//                             SizedBox(
//                               width: 20,
//                             ),
//
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//
//
//             })
//             : snapShot.hasError
//             ? Text('Error')
//             : CircularProgressIndicator();
//       }),
// }