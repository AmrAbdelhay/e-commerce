import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final dynamic snapshot;

  const ProductDetails({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>{

// Future addToFavourite() async {
//
//
//   CollectionReference _collectionRef =
//   FirebaseFirestore.instance.collection("favorite-items");
//   return _collectionRef.firestore
//
//       .collection("items")
//       .doc()
//       .set({
//     "name": widget.snapshot,
//     "price": widget.snapshot,
//     "image": widget.snapshot,
//     "color": widget.snapshot,
//     "size": widget.snapshot,
//     "desc": widget.snapshot,
//
//
//   }).then((value) => print("Added to favourite"));
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adidas Shoes',
        style: TextStyle(
            color: Colors.black,
                fontWeight: FontWeight.bold
        ),
        ),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Color(0xffDAD3C8),
      body:


                           ListView(
                             children: [ Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,


                              children: <Widget>[
                                SizedBox(height: 30),



                                    Center(
                                      child: Container(
                                        height: 250,
                                        width: 300,
                                        child:   CachedNetworkImage(imageUrl:  widget.snapshot
                                          ['image'] ,

                                      ),
                                    ),
                                    ),
                                    SizedBox(height: 30,),
                                Container(

                                  width: 100,
                                  child: Text(
                                    "${widget.snapshot['price']} EGP",
                                    style: TextStyle(

                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),


                                Container(
                                          width: 200,


                                          child: Text(
                                            widget.snapshot['desc'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Mulish',
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 200,

                                          child: Text(
                                            widget.snapshot['color'],
                                            style: TextStyle(
                                              fontFamily: 'Mulish',
                                              fontSize: 30,


                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                Container(
                                  child: Text(''),
                                ),
                                // StreamBuilder<QuerySnapshot>(
                                //     stream: FirebaseFirestore.instance.collection("favorite-items").doc()
                                //         .collection("items").where("name",isEqualTo: widget.snapshot).snapshots(),
                                //     builder: (BuildContext context, AsyncSnapshot snapshot){
                                //       if(snapshot.data==null){
                                //         return Text("");
                                //       }
                                //       return  Padding(
                                //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                //         child: CircleAvatar(
                                //           backgroundColor: Colors.transparent,
                                //           child: IconButton(
                                //             onPressed: () => snapshot.data.docs.length==0?addToFavourite():print("Already Added"),
                                //             icon: snapshot.data.docs.length==0? Icon(
                                //               Icons.favorite_outline,
                                //               color: Colors.white,
                                //             ):Icon(
                                //               Icons.favorite,
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //         ),
                                //       );
                                //     }
                                // ),






                              ],
                          ),
  ]
                           ),
                        );





  }
}
