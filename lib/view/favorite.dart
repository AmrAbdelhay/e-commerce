
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);



  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {


  var fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Favorite') ,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: fireStore.collection('favorite-items').snapshots(),
          builder: (context, snapShot) {
            return snapShot.hasData
                ? ListView.builder(
                itemCount: snapShot.data?.docs.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },



                    child: Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Color(0xffDAD3C8),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child:  CachedNetworkImage(imageUrl:  snapShot.data?.docs[index]
                                  ['image'] ,

                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(20),
                                    color: Colors.grey,

                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        snapShot.data?.docs[index]
                                        ['name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "${snapShot.data?.docs[index]['price']} EGP",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        snapShot.data?.docs[index]
                                        ['size'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 5,
                                ),

                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                        BorderRadius.circular(20),
                                      ),

                                      child: InkWell(
                                        onTap: (){


                                        },
                                        child: Icon(Icons.shopping_cart_outlined,
                                          size: 30 ,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );


                })
                : snapShot.hasError
                ? Text('Error')
                : CircularProgressIndicator();
          }),

    );
  }
}

