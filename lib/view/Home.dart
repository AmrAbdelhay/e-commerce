import 'dart:core';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Product_detaiels.dart';
import 'favorite.dart';
import 'fireStorage.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var fireStore = FirebaseFirestore.instance;
  var fireStorage = FireStorage();

  Future addToFavourite() async {


    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("favorite-items");
    return _collectionRef
        .doc()
        .set({
      "name": fireStore.doc('name'),
      "price": fireStore.doc('price'),
      "image": fireStore.doc('image'),
      "color": fireStore.doc('color'),
      "size": fireStore.doc('size'),
      "desc": fireStore.doc('desc'),


    }).then((value) => print("Added to favourite"));
   }
  // Future addToFavourite() async {



  //  FirebaseFirestore.instance.collection('Product').add(
  //
  //  )
  //
  //
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x72ECE5DB),
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:  StreamBuilder<QuerySnapshot>(
            stream: fireStore.collection('Product').snapshots(),
            builder: (context, snapShot) {
              return snapShot.hasData
                  ? ListView.builder(
                      itemCount: snapShot.data?.docs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetails(
                                  snapshot: snapShot.data?.docs[index],
                                ),
                              ),
                            );
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
                                      StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance.collection('favorite-items()').snapshots(),

                                          builder: (BuildContext context, AsyncSnapshot snapShot){
                                          return
                                            (snapShot.hasData)?Container():
                                                snapShot.hasError? Text('Error')
                                                : CircularProgressIndicator() ;



                                              Container(
                                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.transparent,
                                                child: IconButton(
                                                  onPressed: () => snapShot.data.docs.length==0?addToFavourite():print("Already Added"),
                                                  icon: snapShot.data.docs.length==0? Icon(
                                                    Icons.favorite_outline,
                                                    color: Colors.white,
                                                  ):Icon(
                                                    Icons.favorite,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            );
                                        }
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


        floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.grey ,


      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => Favorite(
            ),

        ),
        );
      },
      child: Icon(Icons.favorite_border,
        size: 40,
      ),


    ),



    );
  }
}
